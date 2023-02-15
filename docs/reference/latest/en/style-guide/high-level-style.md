# Liferay High-Level Style

There are five types of documentation: 

1. **Introduction**: Placed hierarchically at the top of a section, the introduction is a high level explainer that summarizes how the feature can help the reader. It focuses on use cases that solve real-world problems. It also tells readers how the rest of the section enables them to use the feature optimally. 

1. **Concepts**: When a topic requires extensive explanation outside the individual features or the introduction, a concept document fills the gap. This can be placed either before a feature document that shows how the feature works, or more often, after a feature is described, to show all the options available in the feature. An example of the former is [Collection Pages](https://learn.liferay.com/dxp/latest/en/content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.html); an example of the latter is a description of all the available [Workflow Nodes](https://learn.liferay.com/dxp/latest/en/process-automation/workflow/designing-and-managing-workflows/workflow-designer/workflow-nodes.html). 

1. **Feature**: The foundation of all documentation covers each feature and how it works. Keeping paragraphs and explanations to a minimum, feature documentation describes---using numbered steps---how readers can use all of Liferay's features. Feature documentation can be user-focused or developer-focused. Liferay's documentation should always be feature-complete; the types that follow use feature documentation as their basis and reference. 

1. **Series**: Used for training courses, learning paths, and solutions (see below), a series guides the reader through the creation of a concrete solution to a use case. Each series section begins with an introduction and screenshot(s) describing what is to be built in that section, how---at a high level---it will be built, and summarizes with a _Let's Go!_ button to start the steps. The rest of the section contains documents filled primarily with numbered steps that lead the reader through solving a use case in Liferay. The steps documents show only the concrete steps; they have minimal explanation of the features used, and instead contain links to the feature documentation that describes those features in case the reader wants to learn more. If possible, a series always contains a link to a downloadable asset that represents what was created in the series, for import or deployment into the reader's Liferay instance. 

1. **Solution**: A special type of series, solution documentation describes a full-blown Liferay solution that's implemented as a Liferay site initializer. It breaks the solution down into steps the reader can follow to rebuild the solution from scratch. This informs readers about best practices for Liferay implementations and provides a concrete example that's already deployed in their Liferay instances for them to follow. 

## Documentation Voice

We expend much effort to unify the voice of Liferay's documentation. To make many writers sound like one, Liferay's technical writers follow a set of standards and an editorial process that helps ensure that readers encounter the same writing style per article regardless of which writer wrote it. The high level characteristics of this voice are friendly and casual. Beyond that, we keep to the rules listed in chapters one and two of _The Elements of Style_ with a particular emphasis on the rule titled _Omit Needless Words_. 

### Friendly

Prose should be friendly and welcoming. Liferay integrates with many products and services, and they should all be treated equally. Liferay is never compared to any other product in the documentation, and care should be taken not to assume the use of any particular integration product. Give examples as generically as possible. For example, 

> To finish setting up the Foo Engine, set `-Djavax.net.fooey=fooey:verbose` in the Application Server's JVM. In Tomcat, the option is added to `CATALINA_OPTS` in `setenv.sh`: 
> ```
> CATALINA_OPTS="$CATALINA_OPTS -Djavax.net.fooey=fooey:verbose"
> ```

With that said, we avoid documenting other products. For example, in clustering articles, we document what's necessary for configuring Liferay to work in a clustered environment, and we avoid documenting app server configurations beyond our own Docker containers. 

### Casual

Documentation is written in a casual style to make it easy to understand for those for whom English is not a first language. We avoid formality and unnecessarily large words. Contraction use is encouraged to reduce word count and help make the text flow. 

### Steps Rather Than Paragraphs

Whenever possible, break procedural matters into numbered steps, rather than describing them in paragraphs. Information can be buried inside paragraphs and is much easier to find if it appears as part of a numbered list. Additionally, if customers have trouble following the steps, it is helpful to Liferay Support if they can provide the exact step number where the trouble began. 

### Omit Needless Words

William Strunk's famous rule, *Omit Needless Words*, is our mantra. Liferay Technical Writers should study chapters one and two of _Elements of Style_ and follow all the rules, but keep this one most of all in mind. The appendix to this document has a list of oft-used phrases that can be shortened or eliminated to tighten up your writing. 

Obviously, Strunk and White's rules were not directed toward technical writers specifically, but to all writers, who would do well to learn from their experience when writing in any style. Liferay's specific standards for technical documentation (below) are based on the foundation of _Elements of Style_. 

