# Marking Up Faust

## Structural
1. `<l>` line elements
   1. Find: `^.+?$`
   1. Replace: `<l>\0</l>`
   1. Dot matches all: unchecked
   1. This should wrap all text inside `<l>` elements, even the things that we don't want.
1. Stage `<stage>` elements
   1. Find: `\(.+?\)`
     1. All of our `<stage>` elements will be found
     1. The 'simplest' way to fix all of the lines is to perform the find and fix the stage elements manually. The most problematic part of stage elements is that they can occur in many different places, so it seems almost inevitable that we would accidently alter them from other Regex Find/Replace.
     1. `<l>(\(.+?\))</l>`
        1. Will find all of the stage elements directly surrounded by lines.
   1. Find: `<l>(\[.+?)</l>`
   1. Replace: `<stage>\1</stage>`
      1. There are some elements that denote when characters exit the stage, marked by starting with a left bracket `[`.
1. Speaker `<speaker>`
   1. Find: `<l>([A-Z -]+?)</l>`
      1. Since our speaker elements use all caps, we can use a character set of `[A-Z]` to include all capital letters. We also add a space and a hyphen because some of our characters also include those.
      1. Make sure that you have your case sensitive option checked for this
   1. Replace: `<speaker>\1</speaker>`
      1. We also include the `<l>` and `</l>` tags so that they can be automatically replaced.
   1. This may not match all of the speaker elements. For example, there are speakers with a stage direction on the same line. When I delete the line elements encasing these and replace them, the line elements that surrounded that speaker disappear, meaning that they are not included in the search. That means I still needto go through and fix them
      1. Find: `^([A-Z -]+)(?= )`
         1. This will find the rest of the speaker elements, though if you deleted like me, you might have included an extra space in there. This is fixed by the `(?= )`, which is a positive lookahead. This matches the previous part of the statement without including the empty space. So, this will not work if there is no empty space. However, this part is just as simple to do with Find: `^[A-Z]+` or `^[A-Z -]+`, and then mark them up manually by highlighting and Ctrl-E.
            1. This can be neatly avoided by simply dragging the closing `</l>` tag after a stage element and moving it directly after the speaker.
      1. Replace: `<speaker>\1</speaker>`
   1. It's likely that the title was placed inside a speaker element. It should be deleted so it doesn't interfere when we create the `<sp>` elements.
1. Line groups `<lg>`
   1. Find: `\n\n(<l>.+?)\n\n`
   1. Replace: `\n\n<lg>\n\1\n</lg>\n\n`
1. Speech `<sp>`
   1. Find: `(<speaker>.+?)(?=\n<speaker>)`
   1. Replace: `<sp>\n\1</sp>\n`
   1. Dot matches all: checked
      1. This should create almost all of the `<sp>` elements that we need except for the very last one. So, we need to scroll to the bottom in do it manually ourselves, because there is no `<speaker>` element for it to look at, so it does not include the last `<sp>` for us. The `\n` included inside the expressions is just to make our markup look neater when we pretty print it.
1. Scene `<scene>`
   1. Highlight the entire document in encase it in a `<scene>` element. This can clickly be done by using Find: `.+` to highlight the entire document. Add an `@n` for the scene number afterwards.