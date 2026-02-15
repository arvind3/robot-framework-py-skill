const copyButton = document.getElementById("copyInstallCommand");
const installCommand = document.getElementById("installCommand");

if (copyButton && installCommand) {
  copyButton.addEventListener("click", async () => {
    const text = installCommand.textContent.trim();
    const original = copyButton.textContent;
    try {
      await navigator.clipboard.writeText(text);
      copyButton.textContent = "Copied";
      setTimeout(() => {
        copyButton.textContent = original;
      }, 1500);
    } catch {
      copyButton.textContent = "Copy failed";
      setTimeout(() => {
        copyButton.textContent = original;
      }, 1600);
    }
  });
}

const revealTargets = document.querySelectorAll(".reveal");
if (revealTargets.length > 0) {
  const observer = new IntersectionObserver(
    (entries) => {
      for (const entry of entries) {
        if (entry.isIntersecting) {
          entry.target.classList.add("in-view");
          observer.unobserve(entry.target);
        }
      }
    },
    { threshold: 0.16 }
  );

  revealTargets.forEach((element, index) => {
    element.style.transitionDelay = `${Math.min(index * 35, 260)}ms`;
    observer.observe(element);
  });
}
