# gpsd-c4-architecture-documentation

This repository contains architecture documentation using the **C4 model** and **Architecture Decision Records (ADRs)**.The project was created as part of a software architecture assignment, but it is structured as a professional architecture documentation repository.

The goal of this repository is to show how software architecture can be documented in a structured and understandable way. The project uses GPSD as an example system, but the main focus is on architecture documentation practices and tools.

## C4 Model

The C4 model is a visual approach for documenting software architecture. It describes a system at four different levels of detail:

- **System Context**: shows the system, its users, and external systems.
- **Container View**: shows the main applications, services, databases, or major building blocks inside the system.
- **Component View**: shows the internal components of a selected container.
- **Code View**: shows implementation-level details, such as classes or code structure.

This helps readers understand the architecture step by step, from a high-level overview to more detailed internal structures.

In this project, the focus is on the first three levels: **System Context**, **Container View**, and **Component View**. The **Code View** is not included because the goal is to document the architecture, not the low-level implementation details.

## ADRs

ADR stands for **Architecture Decision Record**.

An ADR is a short document that explains an important architecture decision. It usually describes:

- the decision that was made,
- the context behind the decision,
- the reason for the decision,
- and the consequences of the decision.

ADRs explain not only what the architecture looks like, but also why it was designed that way.

There are different ADR templates, and for this project we used the **Michael Nygard ADR template** because it is simple and popular.

## Structurizr DSL

To create interactive C4 diagrams, we used **Structurizr DSL**, a text-based language for creating C4 architecture models.

Instead of drawing diagrams manually, the architecture is described in a `.dsl` file. Structurizr can then generate diagrams and an interactive architecture site from this model.

For this project, the Structurizr model is stored in:

```text
c4model/workspace.dsl
```

## Interactive Structurizr Site

Structurizr can also generate an interactive static site from the architecture model.

In this project, **Docker** was used to run Structurizr and generate the interactive static site from the `workspace.dsl` file.

The generated Structurizr static site is available in:

```text
site/index.html
```

## Tools and Technologies

- C4 Model
- Structurizr DSL
- Architecture Decision Records
- Docker
- Markdown
- GitHub documentation
