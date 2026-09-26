const menuButton = document.getElementById("menuButton");
const menuPanel = document.getElementById("menuPanel");

function closeMenu(){
  menuPanel.classList.remove("open");
  menuPanel.setAttribute("aria-hidden","true");
  menuButton.setAttribute("aria-expanded","false");
}

menuButton.addEventListener("click", (event) => {
  event.stopPropagation();
  const isOpen = menuPanel.classList.toggle("open");
  menuPanel.setAttribute("aria-hidden", String(!isOpen));
  menuButton.setAttribute("aria-expanded", String(isOpen));
});

document.addEventListener("click", (event) => {
  if (!event.target.closest(".header-menu")) closeMenu();
});

document.addEventListener("keydown", (event) => {
  if (event.key === "Escape") closeMenu();
});

menuPanel.querySelectorAll("a").forEach((link) => {
  link.addEventListener("click", closeMenu);
});

const revealObserver = new IntersectionObserver((entries, observer) => {
  entries.forEach((entry) => {
    if (entry.isIntersecting) {
      entry.target.classList.add("visible");
      observer.unobserve(entry.target);
    }
  });
}, {threshold:0.08});

document.querySelectorAll(".reveal").forEach((element) => revealObserver.observe(element));

document.querySelectorAll(".info-box").forEach((details) => {
  details.addEventListener("toggle", () => {
    if (details.open) {
      requestAnimationFrame(() => {
        const top = details.getBoundingClientRect().top + window.scrollY - 95;
        if (top < window.scrollY + 80) {
          window.scrollTo({top, behavior:"smooth"});
        }
      });
    }
  });
});
