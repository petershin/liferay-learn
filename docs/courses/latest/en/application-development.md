---
uuid: 38f72d34-99ad-4e11-b28e-bf41850ee7c7
---
# Application Development

<!-- The main thing we're going for with these is brevity. We don't want a lot of explanation and setting the stage; just a brief introduction to the material. I've read what you have below and am writing this before I edit anything. But before I do that, I wanted to explain my reasoning for the edits: 
    
    - We want to get right to the point. What will you learn in the course and what will you do? 
    - We don't care about historical context. How Liferay development used to be done shouldn't be a part of this. 
    - My understanding is we're not supposed to use the term "low-code." 
    
-Rich
-->

Sometimes Liferay's out-of-the-box features don't cover all the functionality you need. When this happens, you can develop your own applications that interface with Liferay and take advantage of its features. 

Here, we'll continue the story of Delectable Bonsai, a fictional B2B producer of maple syrup products that supplies distributors across the globe. Due to recent growth, Delectable Bonsai needs two custom solutions to streamline business processes and better serve customers:

1. A Distributor Application flow for receiving and approving distributors in a B2B context

1. A Ticketing System for customers to report issues and open requests

These applications are deployable on LXC, LXC-SM, and self-hosted environments.

<!-- Add screenshots of the applications here. -Rich 
Maybe have four images side by side. highlevel picture-->

These applications will help Delectable Bonsai's partners apply for and obtain new business accounts.

When finished, you'll have learned how to

* Use Liferay Objects to define and manage custom data structures that leverage Liferay's core frameworks, including headless APIs, permissions, and more.
* Use Liferay's page builder features to design experiences for creating and displaying object entries.
* Use microservice client extensions to provide back-end functionality to your solutions.
* Use front-end client extensions to build dynamic user experiences that integrate with object APIs.
* Promote custom applications from UAT/DEV to PRD environments.

The first step is modeling data structures for our applications. 

[Let's get started!](./application-development/modeling-data-structures.md)

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} Module One: Modeling Data Structures
:link: ./application-development/modeling-data-structures.md

Learn how to use Liferay Objects to define and manage custom data structures.
:::

:::{grid-item-card} Module Two: Implementing Business Logic
:link: ./application-development/implementing-business-logic.md

Learn how to add validations, notifications, and more to your applications in Liferay DXP.
:::

:::{grid-item-card} Module Three: Designing User Interfaces
:link: ./application-development/designing-user-interfaces.md

Learn how to design application interfaces in Liferay DXP.
:::

:::{grid-item-card} Module Four: Building a Ticketing System
:link: ./application-development/building-a-ticketing-system.md

Learn how to use advanced features to develop a ticketing system.
:::
::::
