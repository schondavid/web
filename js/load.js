document.addEventListener("DOMContentLoaded", async () => {
  const target = document.querySelector(".text");
  if (!target) return;

  const files = ["pwn.html", "rev.html", "web.html", "misc.html"];

  for (const file of files) {
    try {
      const res = await fetch(file);
      if (!res.ok) throw new Error(`Failed to fetch ${file}`);
      const html = await res.text();

      const wrapper = document.createElement("div");
      wrapper.className = "section"; // optional for styling
      wrapper.innerHTML = html;
      target.appendChild(wrapper);

    } catch (err) {
      console.error(err);
    }
  }

  document.dispatchEvent(new Event("filesLoaded"));
});

