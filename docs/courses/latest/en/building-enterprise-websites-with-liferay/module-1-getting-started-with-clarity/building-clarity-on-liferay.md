---
uuid: 35a19aa0-6267-4ff5-9b59-54aef6569b75
---
# Building Clarity on Liferay

!!! abstract
    In this course you'll build an enterprise marketing website for Clarity following both business and IT personas.

Throughout this course, you'll help build an enterprise marketing website for Clarity Vision Solutions. This site is intended to increase brand awareness, showcase their products, and convert visitors to customers. Instead of starting from scratch, you'll work on a partially complete version of Clarity's website, finishing it throughout the course. Along the way, you'll take on different Clarity personas to demonstrate how they can contribute to Clarity's solution.

Before moving on, let's review Clarity's site designs and the personas you'll follow throughout your journey.

## Clarity's Website Designs

Clarity's website development team has produced this site map for their initiative:

![Clarity's website development team has produced this site map for their initiative.](./building-clarity-on-liferay/images/01.png)

This provides a blueprint for Clarity's website. Each page plays a specific role, from showcasing innovative products (e.g., Products) to highlighting the company's core values (e.g., About Us).

To help us transform this blueprint into a vibrant and engaging online experience, Clarity's design team has produced [these mockups](https://www.figma.com/design/vLkKooAPBSwVzQ8QDqJ7NM/Clarity---Public-Enterprise-Website?node-id=606-2&t=JjKxeZyI33GrNPTs-0) for each page in Figma. Before moving on to the next module, take some time to look over these designs and get an idea of what you'll be building.

<iframe style="border: 1px solid rgba(0, 0, 0, 0.1);" width="850" height="650" src="https://www.figma.com/embed?embed_host=share&url=https%3A%2F%2Fwww.figma.com%2Fdesign%2FvLkKooAPBSwVzQ8QDqJ7NM%2FClarity---Public-Enterprise-Website%3Fnode-id%3D606-2%26t%3DZXQNXJwJ4UZPlxT9-1" allowfullscreen></iframe>

### Home

The Homepage is the first impression and it has to count. Clarity’s products are innovative and beautiful, and they want this to be reflected in all that they do, including the new design. They have come up with a clean, minimalist look and feel.

Their teams can leverage many of Liferay’s page builder features right out of the box to empower marketing and design teams to build and manage these pages themselves, on day one. This includes master pages, fragments, collections, stylebooks, and more.

<!--Q: Mention the Sign In page?-->

### Company

<!--TASK: Refine content. -->

In a competitive landscape, clearly defining a brand identity that resonates with potential customers is essential. Clarity's company pages achieve this by highlighting their values, introducing the leadership team shaping the company's vision, and providing clear channels for communication.

The About Us page delves into the company's core values, mission statement, and the driving force behind their innovative products. Here visitors can access leadership profiles and articles highlighting Clarity's commitment to innovation, sustainability, excellence, and design. Finally, the Contact Us page provides a form for submitting questions and displays contact information.

Clarity can build these pages using the same tools as their Home page while also leveraging display pages for the leadership profile and Liferay Objects to build their contact form.

### Products

<!--TASK: Condense-->

Clarity wants to enable site visitors to easily browse their catalog of innovative products and quickly find what they’re looking for, whether that’s eyeglass frames, sunglasses, or contact lenses. The goal is to increase product visibility, focus the user’s attention, and avoid distractions from the buy-path.

To achieve this, they want to implement a new set of product pages that leverage enterprise search capabilities to deliver the most relevant content to end users. Each catalog page has a clean, simple design that’s consistent with the rest of the site, as well as search facets for quickly filtering results. Users can then select individual products to view more information and related products.

Planning for the future, Clarity also wants a platform that includes robust commerce features for receiving and processing orders.

Liferay DXP can bring Clarity's vision to life with a powerful suite of features. Combining enterprise search, categorization, and built-in commerce features, Liferay can empower Clarity to showcase their innovative products and streamline the user’s journey. They can also use features like Search Blueprints to implement advanced personalization, allowing Clarity to tailor experiences for different user segments.

### Blog

Clarity, like many organizations, understands that in order to keep people coming back, increase engagement with visitors, and gain a higher SEO rank, they need to have regular updates. As such, the business wants a Blog section where they can create articles that check all three of these boxes.

Liferay’s suite of content management tools includes the ability to create and manage all kinds of web content, including blogs. With a simple, straightforward editorial process, non-technical users can start contributing right away. Once created, they can then easily display this content in their pages.

### Careers

<!-- To keep up with their rapid growth, Clarity is always looking for talent who aligns with their company values and can deliver real-world results. Their current site doesn’t provide a mechanism for advertising open positions or allowing interested parties to submit resumes. Instead, they have had to work with a third party recruiter. This has proven to be a costly alternative, since Clarity has hired a new employee almost every week for more than 2 years. -->

To reduce these recruitment costs, Clarity wants a dedicated Careers page where they can advertise open positions with the future goal of allowing candidates to submit resumes. This page should provide a simple “search” based experience with multiple filters so that interested parties can browse open positions without wading through irrelevant data. Additionally, they want to build a database of candidates that they can reference as needs arise.

Finally, they want to include analytics for understanding how many users visit the page, what the engagement rate is, and which locations candidates are most interested in.

Liferay has multiple features that allow Clarity to manage this with ease. With Liferay, there is even the possibility of leveraging features from the experience management and segmentation features to auto-detect a user’s location and start with a pre-filtered list based on where they are coming from.

<!-- ### Search

Clarity understands that a powerful search function is critical for a user-friendly website experience. They want visitors to effortlessly find the information they need, whether it's product details, company news, or blog articles. Liferay's advanced search capabilities ensure users can find what they're looking for. -->

### FAQ

Like many businesses, Clarity suffers from a hidden support cost: frequently asked questions (FAQs) that consume valuable customer service resources. To address these costs, Clarity plans to add a dedicated FAQ page to their new website as part of building up a self-service knowledge base. This page will be organized by popular topics drawn from support data analytics and use the clean, minimalist design of the rest of the site. Additionally, each FAQ will include a ‘call to action’ that directs users to related site content. Finally, Clarity wants the page to be easy to update, so non-technical team members can update the list of top FAQs based on current analytics, without relying on IT.

With Liferay, Clarity can easily achieve their requirements while also providing the ability to personalize FAQs for different user segments, whether they’re guests or distributors. They also add a workflow to guide the review process for each FAQ and or even leverage headless APIs to have content generated dynamically based on results from the support system queries.

<!-- ### Error Pages

Broken links and unexpected error pages can disrupt a user's website experience. To maintain user satisfaction and website health, Clarity wants error pages that provide direction to users. With Liferay utility pages, they can do this while leveraging Liferay's redirection tool to manage broken links to maintain website integrity. -->

<!-- ### Distributor Applications

As mentioned previously, the next stage of Clarity’s strategy involves working with international distributors to expand their offering through a strong partner network.

To achieve this goal, Clarity needs a custom solution for receiving, vetting, and approving distributor applications in a B2B context. This solution should store the necessary business information for verifying each applicant's identity and credit for Know Your Customer (KYC) best practice and compliance with Anti-Money Laundering (AML) laws. Additionally, they must collect information that can help them assess the relative value of each prospective distributor.

They also want to implement complex business logic to streamline operations, improve efficiency, and promote consistency across your organization. Examples include validations, notifications, workflow, and account management.

Developing this custom solution from scratch could lead to significant time and resource investment. A low-code platform with robust extension points would empower Clarity to address these complexities while saving money; It does this by reducing development time, lowering the development barrier, improving solution flexibility, and simplifying maintenance.

Liferay DXP’s low-code capabilities provide all of these benefits, so clarity can implement their data structures, business logic, and user interfaces without writing code. Clarity can also use client extensions to further extend the platform to their needs without incurring the overhead that usually comes with custom code. -->

## Clarity Personas

While building this solution, we'll follow these Clarity personas as they contribute according to their various roles:

### IT Personas

![We'll follow these Clarity IT personas.](./building-clarity-on-liferay/images/06.png)

**IT Manager, Ian Miller**: Ensures efficient operation of IT infrastructure, aligning technology strategy with organizational goals.

**Web Developer, Walter Douglas**: Designs, builds, and maintains Clarity's website, ensuring functionality, security, and performance.

### Business Personas

![We'll follow these Clarity Business personas.](./building-clarity-on-liferay/images/07.png)

**Marketing Manager, Clara Murphy**: Develops and executes content strategies to attract and engage visitors, driving brand awareness and conversions.

**Marketing Specialist, Christian Carter**: Creates high-quality content like blog posts and product descriptions, supporting marketing initiatives.

**HR Specialist, Harper Roberts**: Develops and maintains career page content and job descriptions, attracting and informing potential candidates.

## Conclusion

Congratulations! You've completed Module 1: Getting Started with Clarity. Now that we've learned about Clarity and how Liferay can help them overcome their obstacles, let's explore Liferay's deployment options and see which one is best for them.

Next Up: [Module 2: Deploying Liferay](../module-2-deploying-liferay.md)
