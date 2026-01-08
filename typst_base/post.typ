#import "./tag.typ"
#import "@preview/cetz:0.4.2"

#let note(content) = tag.div(class: "note", content)

#let center(..args, content) = tag.div(..args, class: "center", content)

#let canvas(content, caption: none, ..args) = {
  let fig-label = args.at("label", default: none)

  let center-args = if fig-label != none {
    (id: fig-label)
  } else {
    ()
  }

  center(
    ..center-args,
    if caption != none [
      #figure(html.frame(cetz.canvas(content)), caption: caption)

      #if fig-label != none {
        label(args.at("label"))
      }
    ] else {
      html.frame(cetz.canvas(content))
    }
  )
}

#let code(code, ..args) = {
  canvas(..args, {
    cetz.draw.content((0, 0), code)
  })
}

#let spoiler(name, content) = [
  #center[
    #tag.details[
      #tag.summary[#name]

      #content
    ]
  ]
]

#let post(title: none, date: none, content) = [
  #show ref: it => {
    if target() == "html" {
      tag.a(href: "#" + str(it.target), it)
    } else {
      it
    }
  }

  #show footnote: it => {
    context {
      let count = counter(footnote).get().at(0)
      if target() == "html" {
        tag.a(
          id: "footnote-" + str(count) + "-number",
          href: "#footnote-" + str(count) + "-body",
          it
        )
      } else {
        it
      }
    }
  }

  #show math.equation.where(block: false): it => {
    if target() == "html" {
      tag.span(role: "math", html.frame(it))
    } else {
      it
    }
  }

  #show math.equation.where(block: true): it => {
    if target() == "html" {
      tag.figure(role: "math", html.frame(it))
    } else {
      it
    }
  }

  #tag.html[
    #tag.head[
      #tag.meta(name: "viewport", content: "width=device-width, initial-scale=1")
      #tag.meta(http-equiv: "content-type", content: "text/html; charset=UTF-8")

      #tag.link(rel: "stylesheet", href: "/css/articles.css")
      #tag.link(rel: "stylesheet", href: "https://cdn.jsdelivr.net/npm/katex@0.16.6/dist/katex.min.css")

      #tag.script(defer: "", src: "https://cdn.jsdelivr.net/npm/katex@0.16.6/dist/katex.min.js")
      #tag.script(defer: "", src: "https://cdn.jsdelivr.net/npm/katex@0.16.6/dist/contrib/auto-render.min.js")

      #tag.title("schondavid's blog")
    ]

    #tag.body[
      #tag.div(class: "header")[
        #tag.div(class: "nav left")[
          #tag.div[#link("/")[home]]
          #tag.div[#link("/articles")[articles]]
        ]
        #tag.div(class: "center")[
          #tag.div(class: "title")[#title]
          #tag.div(class: "subtitle")[#date]
        ]
      ]

      #tag.div(class: "main")[
        #tag.div(class: "text")[
          #content

          #context {
            let notes = query(footnote)

            if notes.len() > 0 {
              tag.hr()
            }

            tag.div(class: "footnotes",
              for (i, note) in notes.enumerate() {
                tag.div[
                  #tag.a(
                    id: "footnote-" + str(i + 1) + "-body",
                    class: "footnote-body",
                    href: "#footnote-" + str(i + 1) + "-number",
                    str(i + 1)
                  )
                  #note.body
                ]
              }
            )
          }

        ]
      ]
    ]

    #tag.div(class: "footer")[
    ]
  ]
]
#let thoughts(topic: none, content) = [
  #show ref: it => {
    if target() == "html" {
      tag.a(href: "#" + str(it.target), it)
    } else {
      it
    }
  }

  #show footnote: it => {
    context {
      let count = counter(footnote).get().at(0)
      if target() == "html" {
        tag.a(
          id: "footnote-" + str(count) + "-number",
          href: "#footnote-" + str(count) + "-body",
          it
        )
      } else {
        it
      }
    }
  }

  #show math.equation.where(block: false): it => {
    if target() == "html" {
      tag.span(role: "math", html.frame(it))
    } else {
      it
    }
  }

  #show math.equation.where(block: true): it => {
    if target() == "html" {
      tag.figure(role: "math", html.frame(it))
    } else {
      it
    }
  }

  #tag.html[
    #tag.head[
      #tag.meta(name: "viewport", content: "width=device-width, initial-scale=1")
      #tag.meta(http-equiv: "content-type", content: "text/html; charset=UTF-8")

      #tag.link(rel: "stylesheet", href: "/css/articles.css")
      #tag.link(rel: "stylesheet", href: "https://cdn.jsdelivr.net/npm/katex@0.16.6/dist/katex.min.css")

      #tag.script(defer: "", src: "https://cdn.jsdelivr.net/npm/katex@0.16.6/dist/katex.min.js")
      #tag.script(defer: "", src: "https://cdn.jsdelivr.net/npm/katex@0.16.6/dist/contrib/auto-render.min.js")

      #tag.title("schondavid's blog")
    ]

    #tag.body[
      #tag.div(class: "main")[
        #tag.div(class: "text")[
	  #heading(level:1)[#topic]
          #content

          #context {
            let notes = query(footnote)

            if notes.len() > 0 {
              tag.hr()
            }

            tag.div(class: "footnotes",
              for (i, note) in notes.enumerate() {
                tag.div[
                  #tag.a(
                    id: "footnote-" + str(i + 1) + "-body",
                    class: "footnote-body",
                    href: "#footnote-" + str(i + 1) + "-number",
                    str(i + 1)
                  )
                  #note.body
                ]
              }
            )
          }

        ]
      ]
    ]

    #tag.div(class: "footer")[
    ]
  ]
]
