/**
 * SPDX-FileCopyrightText: (c) 2000 Liferay, Inc. https://liferay.com
 * SPDX-License-Identifier: LGPL-2.1-or-later OR LicenseRef-Liferay-DXP-EULA-2.0.0-2023-06
 */

package com.liferay.learn.markdown.converter;

import com.liferay.petra.string.CharPool;
import com.liferay.petra.string.StringBundler;
import com.liferay.petra.string.StringPool;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.util.HashMapBuilder;
import com.liferay.portal.kernel.util.StringUtil;
import com.liferay.portal.kernel.util.Tuple;
import com.liferay.portal.kernel.util.Validator;

import com.vladsch.flexmark.ast.Image;
import com.vladsch.flexmark.ast.Link;
import com.vladsch.flexmark.ext.admonition.AdmonitionExtension;
import com.vladsch.flexmark.ext.anchorlink.AnchorLinkExtension;
import com.vladsch.flexmark.ext.aside.AsideExtension;
import com.vladsch.flexmark.ext.attributes.AttributesExtension;
import com.vladsch.flexmark.ext.definition.DefinitionExtension;
import com.vladsch.flexmark.ext.footnotes.FootnoteExtension;
import com.vladsch.flexmark.ext.gfm.strikethrough.StrikethroughExtension;
import com.vladsch.flexmark.ext.media.tags.MediaTagsExtension;
import com.vladsch.flexmark.ext.superscript.SuperscriptExtension;
import com.vladsch.flexmark.ext.tables.TablesExtension;
import com.vladsch.flexmark.ext.toc.TocExtension;
import com.vladsch.flexmark.ext.typographic.TypographicExtension;
import com.vladsch.flexmark.ext.yaml.front.matter.YamlFrontMatterBlock;
import com.vladsch.flexmark.ext.yaml.front.matter.YamlFrontMatterExtension;
import com.vladsch.flexmark.ext.yaml.front.matter.YamlFrontMatterNode;
import com.vladsch.flexmark.ext.yaml.front.matter.YamlFrontMatterVisitor;
import com.vladsch.flexmark.ext.yaml.front.matter.YamlFrontMatterVisitorExt;
import com.vladsch.flexmark.html.HtmlRenderer;
import com.vladsch.flexmark.parser.Parser;
import com.vladsch.flexmark.util.ast.Document;
import com.vladsch.flexmark.util.ast.Node;
import com.vladsch.flexmark.util.ast.NodeVisitor;
import com.vladsch.flexmark.util.ast.VisitHandler;
import com.vladsch.flexmark.util.ast.Visitor;
import com.vladsch.flexmark.util.data.MutableDataSet;
import com.vladsch.flexmark.util.sequence.BasedSequence;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringReader;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Properties;
import java.util.Set;
import java.util.TreeSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;

import org.eclipse.jgit.api.Git;
import org.eclipse.jgit.diff.DiffEntry;
import org.eclipse.jgit.lib.ObjectId;
import org.eclipse.jgit.lib.Repository;
import org.eclipse.jgit.treewalk.CanonicalTreeParser;

import org.yaml.snakeyaml.Yaml;

/**
 * @author Brian Wing Shun Chan
 * @author Rich Sezov
 * @author Allen Ziegenfus
 */
public class Main {

	public static void main(String[] arguments) throws Exception {
		Properties tokenProperties = new Properties();

		try (InputStream inputStream = Main.class.getResourceAsStream(
				"dependencies/token.properties")) {

			tokenProperties.load(inputStream);
		}

		Main main = new Main(tokenProperties);

		main.convertMarkdown();
	}

	public Main(Properties tokenProperties) throws Exception {
		File learnBaseDirFile = new File("..");

		_learnBaseDirName = learnBaseDirFile.getCanonicalPath();

		File learnDocsDirFile = new File("../docs");

		_learnDocsDirName = learnDocsDirFile.getCanonicalPath();

		File learnSiteDirFile = new File("../site");

		_learnSiteDirName = learnSiteDirFile.getCanonicalPath();

		Enumeration<String> enumeration =
			(Enumeration<String>)tokenProperties.propertyNames();

		while (enumeration.hasMoreElements()) {
			String key = enumeration.nextElement();

			if (key.endsWith("_TOKEN")) {
				_tokens.put(
					tokenProperties.getProperty(key),
					tokenProperties.getProperty(key + "_VALUE"));
			}
		}

		_initFileNames(_learnDocsDirName);
		_initFlexmark();
		_initGitDiff(learnBaseDirFile);
	}

	public void convertMarkdown() throws Exception {
		Set<String> uuids = new HashSet<>();

		for (String fileName : _fileNames) {
			if (!fileName.endsWith(".md")) {
				continue;
			}

			try {
				_validateUUID(uuids, fileName);

				if (!_diffFileNames.isEmpty() &&
					!_diffFileNames.contains(
						fileName.replace(_learnBaseDirName, ""))) {

					System.out.println("Skipped: " + fileName);

					continue;
				}

				File file = new File(fileName);

				String text = _processMarkdown(
					FileUtils.readFileToString(file, StandardCharsets.UTF_8),
					file);

				String htmlFileName = FilenameUtils.getName(
					fileName
				).replace(
					".md", ".html"
				);

				String parentFileDir = file.getParent(
				).replaceFirst(
					_learnDocsDirName, ""
				);

				String htmlFileDir = _learnSiteDirName + parentFileDir;

				File htmlFile = new File(htmlFileDir, htmlFileName);

				FileUtils.writeStringToFile(
					htmlFile, _toHTML(file, text), StandardCharsets.UTF_8);

				System.out.println("Saved: " + htmlFile.getCanonicalPath());
			}
			catch (Exception exception) {
				_error(exception.getMessage());
			}
		}

		if (!_errorMessages.isEmpty()) {
			System.out.println(_errorMessages.size() + " error messages:");

			for (String errorMessage : _errorMessages) {
				System.out.println(errorMessage);
			}

			throw new Exception(_errorMessages.size() + " error messages");
		}

		if (!_warningMessages.isEmpty()) {
			System.out.println(_warningMessages.size() + " warning messages:");

			for (String warningMessage : _warningMessages) {
				System.out.println(warningMessage);
			}
		}
	}

	private String _dedent(int dedent, String line) {
		if (line == null) {
			return null;
		}

		int length = line.length();

		if (length == 0) {
			return line;
		}

		int index = 0;

		while ((index < length) && (index < dedent)) {
			char c = line.charAt(index);

			if (((c > CharPool.SPACE) && (c < 128)) ||
				!Character.isWhitespace(c)) {

				break;
			}

			index++;
		}

		if (index > 0) {
			return line.substring(index);
		}

		return line;
	}

	private void _error(String errorMessage) {
		System.out.println(errorMessage);

		_errorMessages.add(errorMessage);
	}

	private String _getUuid(String text) {
		Document document = _parser.parse(text);

		SnakeYamlFrontMatterVisitor snakeYamlFrontMatterVisitor =
			new SnakeYamlFrontMatterVisitor();

		snakeYamlFrontMatterVisitor.visit(document);

		Map<String, Object> data = snakeYamlFrontMatterVisitor.getData();

		if ((data == null) || !data.containsKey("uuid")) {
			return StringPool.BLANK;
		}

		Object uuid = data.get("uuid");

		if (!(uuid instanceof String)) {
			return StringPool.BLANK;
		}

		return uuid.toString();
	}

	private void _initFileNames(String fileName) {
		File file = new File(fileName);

		if (file.isDirectory() &&
			!Objects.equals(file.getName(), "resources") &&
			!Objects.equals(file.getName(), "_snippets")) {

			for (String currentFileName : file.list()) {
				_initFileNames(fileName + "/" + currentFileName);
			}
		}

		_fileNames.add(fileName);
	}

	private void _initFlexmark() {
		MutableDataSet mutableDataSet = new MutableDataSet(
		).set(
			AdmonitionExtension.QUALIFIER_TYPE_MAP,
			HashMapBuilder.put(
				"error", "error"
			).put(
				"important", "important"
			).put(
				"note", "note"
			).put(
				"tip", "tip"
			).put(
				"warning", "warning"
			).build()
		).set(
			AdmonitionExtension.TYPE_SVG_MAP, new HashMap<String, String>()
		).set(
			AsideExtension.ALLOW_LEADING_SPACE, true
		).set(
			AsideExtension.EXTEND_TO_BLANK_LINE, false
		).set(
			AsideExtension.IGNORE_BLANK_LINE, false
		).set(
			AsideExtension.INTERRUPTS_ITEM_PARAGRAPH, true
		).set(
			AsideExtension.INTERRUPTS_PARAGRAPH, true
		).set(
			AsideExtension.WITH_LEAD_SPACES_INTERRUPTS_ITEM_PARAGRAPH, true
		).set(
			HtmlRenderer.GENERATE_HEADER_ID, true
		).set(
			Parser.EXTENSIONS,
			Arrays.asList(
				AdmonitionExtension.create(), AnchorLinkExtension.create(),
				AsideExtension.create(), AttributesExtension.create(),
				DefinitionExtension.create(), FootnoteExtension.create(),
				MediaTagsExtension.create(), StrikethroughExtension.create(),
				SuperscriptExtension.create(), TablesExtension.create(),
				TocExtension.create(), TypographicExtension.create(),
				YamlFrontMatterExtension.create())
		);

		_renderer = HtmlRenderer.builder(
			mutableDataSet
		).build();

		_parser = Parser.builder(
			mutableDataSet
		).build();
	}

	private void _initGitDiff(File dir) throws Exception {
		_initLatestHash();

		Git git = Git.open(new File(dir, ".git"));

		Repository repository = git.getRepository();

		ObjectId objectId = repository.resolve(_latestHash);

		if (objectId == null) {
			return;
		}

		CanonicalTreeParser oldCanonicalTreeParser = new CanonicalTreeParser();

		oldCanonicalTreeParser.reset(
			repository.newObjectReader(),
			repository.parseCommit(
				objectId
			).getTree(
			).getId());

		CanonicalTreeParser newCanonicalTreeParser = new CanonicalTreeParser();

		newCanonicalTreeParser.reset(
			repository.newObjectReader(),
			repository.parseCommit(
				repository.resolve("HEAD")
			).getTree(
			).getId());

		List<DiffEntry> diffs = git.diff(
		).setOldTree(
			oldCanonicalTreeParser
		).setNewTree(
			newCanonicalTreeParser
		).call();

		for (DiffEntry diff : diffs) {
			if (diff.getNewPath(
				).endsWith(
					".md"
				)) {

				_diffFileNames.add("/" + diff.getNewPath());
			}
		}
	}

	private void _initLatestHash() throws Exception {
		File file = new File(_learnBaseDirName, ".latest_hash");

		if (file.exists()) {
			_latestHash = Files.readString(file.toPath());
		}
	}

	private String _processGridBlock(List<String> gridLines, int columns) {
		List<GridCard> gridCards = new ArrayList<>();

		GridCard currentGridCard = new GridCard();

		for (String gridLine : gridLines) {
			if (gridLine.equals(":::")) {
				gridCards.add(currentGridCard);

				currentGridCard = new GridCard();
			}
			else if (gridLine.startsWith(":::{grid-item-card}")) {
				int index = gridLine.indexOf(StringPool.CLOSE_CURLY_BRACE);

				currentGridCard.setTitle(gridLine.substring(index + 2));
			}
			else if (gridLine.startsWith(":gutter")) {
			}
			else if (gridLine.startsWith(":link:")) {
				String link = gridLine.substring(7);

				currentGridCard.setLink(
					StringUtil.removeSubstring(link, ".md"));
			}
			else {
				currentGridCard.addContentLine(gridLine);
			}
		}

		StringBundler sb = new StringBundler(4 + gridCards.size());

		sb.append("<div class=\"landing-page landing-page-grid-");
		sb.append(String.valueOf(columns));
		sb.append("\">");

		for (GridCard gridCard : gridCards) {
			sb.append(gridCard);
		}

		sb.append("</div>");

		return sb.toString();
	}

	private String _processGridBlocks(
			BufferedReader bufferedReader, String line, File markdownFile)
		throws Exception {

		String trimmedLine = line.trim();

		if (!trimmedLine.startsWith("::::{grid}")) {
			return line;
		}

		List<String> gridLines = new ArrayList<>();

		int index = line.indexOf(StringPool.CLOSE_CURLY_BRACE);

		int columns = Integer.valueOf(
			StringUtil.trim(line.substring(index + 2)));

		while (true) {
			String gridLine = bufferedReader.readLine();

			if (gridLine == null) {
				_warn(
					"Unclosed grid block found in " +
						markdownFile.getCanonicalPath());

				break;
			}

			String trimmedGridLine = gridLine.trim();

			if (trimmedGridLine.startsWith("::::")) {
				break;
			}

			gridLines.add(gridLine);
		}

		return _processGridBlock(gridLines, columns);
	}

	private String _processInclude(String includeFileName, File markdownFile)
		throws Exception {

		File file = null;

		String markdownFileName = markdownFile.getCanonicalPath();

		if (includeFileName.startsWith(File.separator)) {
			String dirName = markdownFileName.substring(
				_learnDocsDirName.length() + 1);

			String[] dirNameParts = StringUtil.split(
				dirName, File.separatorChar);

			if (dirNameParts.length < 3) {
				throw new Exception("Invalid directory " + dirName);
			}

			StringBuilder sb = new StringBuilder();

			sb.append(_learnDocsDirName);
			sb.append(File.separator);
			sb.append(dirNameParts[0]);
			sb.append(File.separator);
			sb.append(dirNameParts[1]);
			sb.append(File.separator);
			sb.append(dirNameParts[2]);
			sb.append(includeFileName);

			file = new File(sb.toString());
		}
		else {
			file = new File(
				FilenameUtils.getFullPath(markdownFileName) + includeFileName);
		}

		if (!file.exists()) {
			throw new Exception("Nonexistent include " + file);
		}

		return _processMarkdown(
			FileUtils.readFileToString(file, StandardCharsets.UTF_8),
			markdownFile);
	}

	private String _processLiteralInclude(
			String literalIncludeFileName,
			List<Tuple> literalIncludeLineRangeTuples,
			Map<String, String> literalIncludeParameters, File markdownFile)
		throws Exception {

		String fileName =
			FilenameUtils.getFullPath(markdownFile.getPath()) +
				literalIncludeFileName;

		File file = new File(fileName);

		if (!file.exists()) {
			file = new File(fileName.replaceAll("/ja/", "/en/"));
		}

		if (!file.exists()) {
			_warn("Nonexistent literal include " + file);

			return StringPool.BLANK;
		}

		StringBuilder sb = new StringBuilder();

		sb.append("```");
		sb.append(
			GetterUtil.getString(
				literalIncludeParameters.get("language"), "java"));
		sb.append("\n");

		for (Tuple literalIncludeLineRangeTuple :
				literalIncludeLineRangeTuples) {

			sb.append(
				_processLiteralIncludeLineRange(
					file, literalIncludeLineRangeTuple,
					literalIncludeParameters));
		}

		sb.append("```");

		return sb.toString();
	}

	private String _processLiteralIncludeBlock(
			String literalIncludeFileName, File markdownFile,
			List<String> mySTDirectiveLines)
		throws Exception {

		Map<String, String> literalIncludeParameters = new HashMap<>();
		List<Tuple> literalIncludeLineRangeTuples = new ArrayList<>();

		for (String mySTDirectiveLine : mySTDirectiveLines) {
			Matcher matcher = _literalIncludeParameterPattern.matcher(
				mySTDirectiveLine.trim());

			if (!matcher.find()) {
				continue;
			}

			String name = matcher.group(1);
			String value = matcher.group(2);

			if (name.equals("lines")) {
				for (String lineRange :
						StringUtil.split(value, CharPool.COMMA)) {

					Tuple tuple = null;

					String[] lineRangeParts = StringUtil.split(
						lineRange, CharPool.DASH);

					if (lineRangeParts.length == 1) {
						tuple = new Tuple(
							GetterUtil.getInteger(lineRangeParts[0]),
							GetterUtil.getInteger(lineRangeParts[0]));
					}
					else if (lineRangeParts.length == 2) {
						tuple = new Tuple(
							GetterUtil.getInteger(lineRangeParts[0]),
							GetterUtil.getInteger(lineRangeParts[1]));
					}
					else {
						throw new Exception(
							"Invalid literal include lines value " + value);
					}

					literalIncludeLineRangeTuples.add(tuple);
				}
			}
			else {
				literalIncludeParameters.put(name, value);
			}
		}

		if (literalIncludeLineRangeTuples.isEmpty()) {
			literalIncludeLineRangeTuples.add(new Tuple(0, -1));
		}

		return _processLiteralInclude(
			literalIncludeFileName, literalIncludeLineRangeTuples,
			literalIncludeParameters, markdownFile);
	}

	private String _processLiteralIncludeLineRange(
			File file, Tuple literalIncludeLineRangeTuple,
			Map<String, String> literalIncludeParameters)
		throws Exception {

		StringBuilder sb = new StringBuilder();

		int dedent = GetterUtil.getInteger(
			literalIncludeParameters.get("dedent"));
		int lineEnd = GetterUtil.getInteger(
			literalIncludeLineRangeTuple.getObject(1), -1);
		int lineStart = GetterUtil.getInteger(
			literalIncludeLineRangeTuple.getObject(0));

		BufferedReader bufferedReader = new BufferedReader(
			new InputStreamReader(new FileInputStream(file)));
		int i = 0;
		String line = null;

		while ((line = bufferedReader.readLine()) != null) {
			if (i >= (lineStart - 1)) {
				sb.append(_dedent(dedent, line) + "\n");
			}

			if ((lineEnd != -1) && (i > (lineEnd - 2))) {
				break;
			}

			i++;
		}

		return sb.toString();
	}

	private String _processMarkdown(String markdown, File markdownFile)
		throws Exception {

		StringBuilder sb = new StringBuilder();

		BufferedReader bufferedReader = new BufferedReader(
			new StringReader(markdown));
		String line = null;

		while ((line = bufferedReader.readLine()) != null) {
			line = _processGridBlocks(bufferedReader, line, markdownFile);
			line = _processMySTDirectiveBlocks(
				bufferedReader, line, markdownFile);
			line = _processSphinxBadges(line);
			line = _processTokens(line);

			sb.append(line);

			sb.append("\n");
		}

		return sb.toString();
	}

	private String _processMySTDirectiveBlocks(
			BufferedReader bufferedReader, String line, File markdownFile)
		throws Exception {

		String trimmedLine = line.trim();

		if (!trimmedLine.startsWith(_MYST_DIRECTIVE_BLOCK_START)) {
			return line;
		}

		String leadingWhitespace = line.substring(
			0, line.indexOf(_MYST_DIRECTIVE_BLOCK_START));

		List<String> mySTDirectiveLines = new ArrayList<>();

		int index = line.indexOf(StringPool.CLOSE_CURLY_BRACE);

		String directiveName = line.substring(
			line.indexOf(StringPool.OPEN_CURLY_BRACE) + 1, index);

		while (true) {
			String mySTDirectiveLine = bufferedReader.readLine();

			if (mySTDirectiveLine == null) {
				_warn(
					"Unclosed MyST directive block found in " +
						markdownFile.getCanonicalPath());

				break;
			}

			mySTDirectiveLine = _processTokens(mySTDirectiveLine);

			if (mySTDirectiveLine.startsWith(
					leadingWhitespace + _MYST_DIRECTIVE_BLOCK_END)) {

				break;
			}

			mySTDirectiveLines.add(mySTDirectiveLine);
		}

		String directiveArguments = line.substring(index + 1);

		directiveArguments = directiveArguments.trim();

		if (directiveName.equals("include")) {
			return _processInclude(directiveArguments, markdownFile);
		}
		else if (directiveName.equals("literalinclude")) {
			return _processLiteralIncludeBlock(
				directiveArguments, markdownFile, mySTDirectiveLines);
		}
		else if (directiveName.equals("raw")) {
			for (String mySTDirectiveLine : mySTDirectiveLines) {
				Matcher matcher = _literalIncludeParameterPattern.matcher(
					mySTDirectiveLine.trim());

				if (!matcher.find()) {
					continue;
				}

				String name = matcher.group(1);

				if (name.equals("file")) {
					String value = matcher.group(2);

					if (value.contains("landingpage_template.html")) {
						_landingPageFiles.add(markdownFile);

						return StringPool.BLANK;
					}

					return _processInclude(value.trim(), markdownFile);
				}
			}

			_warn(
				"Invalid parameters found for raw directive block in " +
					markdownFile.getCanonicalPath());

			return StringPool.BLANK;
		}
		else if (directiveName.equals("toctree")) {
			return StringPool.BLANK;
		}

		StringBuilder sb = new StringBuilder();

		for (int i = 0; i < line.indexOf(trimmedLine); i++) {
			sb.append(" ");
		}

		sb.append("!!! ");
		sb.append(directiveName);
		sb.append(" \"");
		sb.append(directiveName);
		sb.append("\" \n");

		for (String mySTDirectiveLine : mySTDirectiveLines) {
			sb.append("    ");
			sb.append(mySTDirectiveLine);
			sb.append("\n");
		}

		return sb.toString();
	}

	private String _processSphinxBadges(String line) {
		Matcher matcher = _sphinxBadgePattern.matcher(line);

		if (matcher.find()) {
			line = matcher.replaceFirst("<span class=\"bdg bdg-$1\">$2</span>");
		}

		return line;
	}

	private String _processTokens(String line) {
		for (Map.Entry<String, String> entry : _tokens.entrySet()) {
			line = StringUtil.replace(line, entry.getKey(), entry.getValue());
		}

		return line;
	}

	private String _toHTML(File file, String text) throws Exception {
		_write(text, "build/markdown", file);

		Document document = _parser.parse(text);

		_markdownFile = file;

		try {
			_nodeVisitor.visit(document);
		}
		finally {
			_markdownFile = null;
		}

		String html = _renderer.render(document);

		_write(html, "build/html", file);

		return html;
	}

	private void _validateUUID(Set<String> uuids, String fileName)
		throws Exception {

		if (!fileName.contains("/en/")) {
			return;
		}

		File englishFile = new File(fileName);

		String englishText = FileUtils.readFileToString(
			englishFile, StandardCharsets.UTF_8);

		String uuid = _getUuid(englishText);

		if (Validator.isNull(uuid)) {
			throw new Exception("Missing UUID in " + fileName);
		}

		if (uuids.contains(uuid)) {
			throw new Exception(
				StringBundler.concat(
					"Duplicate UUID ", uuid, " in ", fileName));
		}

		uuids.add(uuid);
	}

	private void _visit(Image image) throws Exception {
		BasedSequence basedSequence = image.getUrl();

		if (basedSequence.startsWith("http")) {
			return;
		}

		String fileName =
			FilenameUtils.getFullPath(_markdownFile.getPath()) + basedSequence;

		fileName = fileName.replaceAll("/ja/", "/en/");

		File file = new File(fileName);

		if (!file.exists()) {
			_warn(
				_markdownFile.getCanonicalPath() +
					" references nonexistent image file " +
						file.getCanonicalPath());

			return;
		}

		_nodeVisitor.visitChildren(image);
	}

	private void _visit(Link link) {
		BasedSequence basedSequence = link.getUrl();

		link.setUrl(basedSequence.replace(".md", StringPool.BLANK));
	}

	private void _warn(String warningMessage) {
		System.out.println(warningMessage);

		_warningMessages.add(warningMessage);
	}

	private void _write(String content, String dirName, File markdownFile)
		throws Exception {

		String markdownFileName = markdownFile.getCanonicalPath();

		markdownFileName = markdownFileName.substring(
			_learnDocsDirName.length());

		File file = new File(dirName + markdownFileName);

		FileUtils.forceMkdirParent(file);

		FileUtils.writeStringToFile(file, content, StandardCharsets.UTF_8);
	}

	private static final String _MYST_DIRECTIVE_BLOCK_END = "```";

	private static final String _MYST_DIRECTIVE_BLOCK_START = "```{";

	private static final Pattern _literalIncludeParameterPattern =
		Pattern.compile(":(.*): (.*)");
	private static final Pattern _sphinxBadgePattern = Pattern.compile(
		"\\{bdg-(.*)\\}`(.*)`");

	private final Set<String> _diffFileNames = new TreeSet<>();
	private final List<String> _errorMessages = new ArrayList<>();
	private final Set<String> _fileNames = new TreeSet<>();
	private final Set<File> _landingPageFiles = new HashSet<>();
	private String _latestHash;
	private final String _learnBaseDirName;
	private final String _learnDocsDirName;
	private final String _learnSiteDirName;
	private File _markdownFile;

	private final NodeVisitor _nodeVisitor = new NodeVisitor(
		new VisitHandler<Image>(
			Image.class,
			new Visitor<Image>() {

				@Override
				public void visit(Image image) {
					try {
						_visit(image);
					}
					catch (Exception exception) {
						_error(
							_markdownFile.getPath() + ": " +
								exception.getMessage());
					}
				}

			}),
		new VisitHandler<Link>(
			Link.class,
			new Visitor<Link>() {

				@Override
				public void visit(Link link) {
					_visit(link);
				}

			}));

	private Parser _parser;
	private HtmlRenderer _renderer;
	private Map<String, String> _tokens = new HashMap<>();
	private final List<String> _warningMessages = new ArrayList<>();
	private final Yaml _yaml = new Yaml();

	private class GridCard {

		public void addContentLine(String contentLine) {
			_contentLines.add(contentLine);
		}

		public String getTitleHTML(boolean link) {
			StringBundler sb = new StringBundler(3);

			if (link) {
				sb.append("<h4 class=\"primary-heading-link title\">");
			}
			else {
				sb.append("<h4 class=\"title\">");
			}

			sb.append(_title);
			sb.append("</h4>");

			return sb.toString();
		}

		public void setLink(String link) {
			_link = link;
		}

		public void setTitle(String title) {
			_title = title;
		}

		public String toString() {
			StringBundler sb = new StringBundler(16);

			sb.append("<div class=\"section-card\">");
			sb.append("<div class=\"autofit-row autofit-row-center\">");
			sb.append("<div class=\"autofit-col autofit-col-expand\">");

			if (Validator.isNotNull(_link)) {
				sb.append("<a href=\"");
				sb.append(_link);
				sb.append("\">");

				if (Validator.isNotNull(_title)) {
					sb.append(getTitleHTML(true));
				}

				sb.append("</a>");
			}
			else if (Validator.isNotNull(_title)) {
				sb.append(getTitleHTML(false));
			}

			if (!_contentLines.isEmpty()) {
				sb.append("<div class=\"subsection-wrapper\">");

				for (String contentLine : _contentLines) {
					sb.append(contentLine);
					sb.append(StringPool.NEW_LINE);
				}

				sb.append("</div>");
			}

			sb.append("</div>");
			sb.append("</div>");
			sb.append("</div>");

			return sb.toString();
		}

		private List<String> _contentLines = new ArrayList<>();
		private String _link = StringPool.BLANK;
		private String _title = StringPool.BLANK;

	}

	private class SnakeYamlFrontMatterVisitor
		implements YamlFrontMatterVisitor {

		public Map<String, Object> getData() {
			return _data;
		}

		public void visit(Node node) {
			_yamlFrontMatterVisitor.visit(node);
		}

		@Override
		public void visit(YamlFrontMatterBlock yamlFrontMatterBlock) {
			String yamlString = String.valueOf(yamlFrontMatterBlock.getChars());

			yamlString = yamlString.replaceAll("---", "");

			_data = _yaml.load(yamlString);
		}

		@Override
		public void visit(YamlFrontMatterNode yamlFrontMatterNode) {
		}

		private Map<String, Object> _data;
		private final NodeVisitor _yamlFrontMatterVisitor = new NodeVisitor(
			YamlFrontMatterVisitorExt.VISIT_HANDLERS(this));

	}

}