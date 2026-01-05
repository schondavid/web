document.addEventListener("DOMContentLoaded", () => {
  const target = document.querySelector(".text");
  if (!target) return;

  const files = ["pwn.html"];

  files.forEach(file => {
    fetch(file)
      .then(res => {
        if (!res.ok) throw new Error(`Failed to fetch ${file}`);
        return res.text();
      })
      .then(html => {
        const wrapper = document.createElement("div");
        wrapper.className = "section"; // optional for styling
        wrapper.innerHTML = html;
        target.appendChild(wrapper);
      })
      .catch(err => console.error(err));
  });
});

