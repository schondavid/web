#import "../../../typst/post.typ"


#show: content => post.post(
  title: "Example Post",
  date: "13.11.2025",
  content
)

#post.note[
  #lorem(12) 
]

= Overview

#lorem(42)

```rust
// An 8-byte-aligned address.
pub struct Addr(*const u64);

// Returns a 16-byte aligned address.
fn alloc_double_word(&mut self) -> Option<Addr>

// Frees an 8-byte aligned address.
fn free_single_word(&mut self, addr: Addr)

// Frees a 16-byte aligned address.
fn free_double_word(&mut self, addr: Addr)
```


== Subsection

#lorem(32)


