#import "themes/njit.typ": *

#show: university-theme.with(
  short-title: [Test],
)

#title-slide(
  title: [Test],
)

#slide(title: [Test Slide])[
  #code(title: "my_code.rst", [
      ```rust
      fn alsa() {
        set line = 1;
        // wookie <1>
        // double test
      }
      ```
    ],
    callouts: (
      ("<1>", "this is a callout"),
      ("<2>", "also a callout"),
    ),
  )
]
