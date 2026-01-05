document.addEventListener("filesLoaded", () => {
  const nav = document.querySelector(".nav.left");
  const content = document.querySelector(".text");

  if (!nav || !content) return;

  const headings = content.querySelectorAll("h2, h3");

  headings.forEach(h => {
    if (!h.id)
      h.id = h.textContent.toLowerCase().replace(/\s+/g, "-");

    const link = document.createElement("a");
    link.href = "#" + h.id;
    link.textContent = h.textContent;

    const wrapper = document.createElement("div");

    if (h.tagName.toLowerCase() === "h3") {
      wrapper.style.marginLeft = "12px";
    }

    wrapper.appendChild(link);

    nav.appendChild(wrapper);
  });
});

