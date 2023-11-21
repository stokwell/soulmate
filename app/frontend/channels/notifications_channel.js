import consumer from "./consumer"

consumer.subscriptions.create("NotificationsChannel", {
  connected() {
    console.log("Connected to notifications channel")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const alertElement = document.querySelector('.alert.alert-primary');

    if (alertElement) {
      const newAlert = document.createElement('div');
      newAlert.classList.add('alert', 'alert-success');
      newAlert.setAttribute('role', 'alert');
      newAlert.textContent = 'CSV export has completed.';
      alertElement.parentNode.replaceChild(newAlert, alertElement);
    }
  }
});
