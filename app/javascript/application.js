// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// Toast Notifications Auto-remove
document.addEventListener('turbo:load', () => {
  const toasts = document.querySelectorAll('.toast-notification');
  
  toasts.forEach((toast) => {
    // Auto remove after animation completes (4.4 seconds)
    setTimeout(() => {
      if (toast.parentElement) {
        toast.remove();
      }
    }, 4400);
  });
});

