# Accessibility (<abbr title="Accessibility">A11Y</abbr>) To-Do

## How to Read this Book

To understand the story of this application's development history, read each
commit message alongside the [output of `git diff`][how-to-read-a-git-diff].

Some commits demonstrate [Rails' strength][Rails] in building [Create, Read,
Update, and Delete <abbr title="Create, Read, Update, and
Delete">CRUD</abbr>][CRUD] applications, while others emphasize the significance
of the presence or absence of [HTML Element attributes][mdn-attributes], while
others still demonstrate how to keep pages feeling interactive through minimal
JavaScript enhancements.

[how-to-read-a-git-diff]: https://www.atlassian.com/git/tutorials/saving-changes/git-diff
[CRUD]: https://en.wikipedia.org/wiki/Create,_read,_update_and_delete
[mdn-attributes]: https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes

## Goals

Instead of building a production-ready Task Management Application, this body of
work is more interested in demonstrating how to render and modify semantically
meaningful HTML in service of wide-ranging access.

With that being said, these commits _are not_ interested in:

* shipping a bullet-proof To-do application
* demonstrating strong visual aesthetics
* demonstrating how to build a sophisticated [finite state machine][]

[finite state machine]: https://en.wikipedia.org/wiki/Finite-state_machine

## Technologies

The application serves [Rails-generated][Rails] HTML that is styled with
[TailwindCSS][] and progressively enhanced through a combination of
[Turbolinks][], [RailsUJS][], and [StimulusJS][].

[Rails]: https://rubyonrails.org/
[TailwindCSS]: https://tailwindcss.com/
[Turbolinks]: https://github.com/turbolinks/turbolinks/tree/v5.2.0
[RailsUJS]: https://edgeguides.rubyonrails.org/working_with_javascript_in_rails.html#unobtrusive-javascript
[StimulusJS]: https://stimulusjs.org/
