(() => {
  const $ = (s, root = document) => root.querySelector(s);
  const $$ = (s, root = document) => [...root.querySelectorAll(s)];

  const revealItems = $$('.reveal');
  const observer = new IntersectionObserver((entries, obs) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
        obs.unobserve(entry.target);
      }
    });
  }, { threshold: 0.12, rootMargin: '0px 0px -40px 0px' });
  revealItems.forEach(el => observer.observe(el));

  const toast = $('#toast');
  let toastTimer;
  $$('.copy-btn').forEach(button => {
    button.addEventListener('click', async () => {
      const value = button.dataset.copy;
      try {
        await navigator.clipboard.writeText(value);
      } catch {
        const helper = document.createElement('textarea');
        helper.value = value;
        helper.style.position = 'fixed';
        helper.style.opacity = '0';
        document.body.appendChild(helper);
        helper.select();
        document.execCommand('copy');
        helper.remove();
      }
      const original = button.textContent;
      button.textContent = 'Copied';
      toast.textContent = 'Path copied to clipboard';
      toast.classList.add('show');
      clearTimeout(toastTimer);
      toastTimer = setTimeout(() => {
        toast.classList.remove('show');
        button.textContent = original;
      }, 1500);
    });
  });

  const bindRegionCards = root => {
    $$('.region-card', root).forEach(card => {
      if (card.dataset.bound === 'true') return;
      card.dataset.bound = 'true';
      card.addEventListener('pointermove', e => {
        const r = card.getBoundingClientRect();
        card.style.setProperty('--mx', `${((e.clientX - r.left) / r.width) * 100}%`);
        card.style.setProperty('--my', `${((e.clientY - r.top) / r.height) * 100}%`);
      });
      card.addEventListener('click', () => {
        const url = card.dataset.url;
        if (url) window.location.href = url;
      });
    });
  };
  bindRegionCards();

  const finePointer = matchMedia('(pointer:fine)').matches;
  if (finePointer) {
    $$('[data-tilt]').forEach(card => {
      card.addEventListener('pointermove', e => {
        const r = card.getBoundingClientRect();
        const x = (e.clientX - r.left) / r.width - .5;
        const y = (e.clientY - r.top) / r.height - .5;
        card.style.transform = `perspective(900px) rotateX(${(-y * 3).toFixed(2)}deg) rotateY(${(x * 3).toFixed(2)}deg)`;
      });
      card.addEventListener('pointerleave', () => card.style.transform = '');
    });
  }

  const categories = $$('.category-card');
  const panels = $$('.install-panel');
  const showPanel = targetId => {
    panels.forEach(panel => {
      const active = panel.id === targetId;
      panel.hidden = !active;
      if (active) {
        bindRegionCards(panel);
        $$('.reveal', panel).forEach(el => el.classList.add('visible'));
      }
    });
    categories.forEach(button => {
      const active = button.dataset.target === targetId;
      button.classList.toggle('active', active);
      button.setAttribute('aria-expanded', String(active));
    });
  };

  categories.forEach(button => {
    button.addEventListener('click', () => {
      const targetId = button.dataset.target;
      const isActive = button.classList.contains('active');
      showPanel(isActive ? '' : targetId);
      if (!isActive) {
        setTimeout(() => $("#" + targetId)?.scrollIntoView({ behavior: 'smooth', block: 'start' }), 40);
      }
    });
  });

  const backTop = $('#backTop');
  const updateTop = () => backTop.classList.toggle('show', scrollY > 600);
  addEventListener('scroll', updateTop, { passive: true });
  updateTop();
  backTop.addEventListener('click', () => scrollTo({ top: 0, behavior: 'smooth' }));
})();
