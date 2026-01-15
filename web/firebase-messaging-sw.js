importScripts(
  "https://www.gstatic.com/firebasejs/10.7.1/firebase-app-compat.js"
);
importScripts(
  "https://www.gstatic.com/firebasejs/10.7.1/firebase-messaging-compat.js"
);

firebase.initializeApp({
  apiKey: "AIzaSyDDOXbJPRXV4HJvP6Yi80b65F6lVUS6YIY",
  authDomain: "manajemen-kegiatan.firebaseapp.com",
  projectId: "manajemen-kegiatan",
  storageBucket: "manajemen-kegiatan.firebasestorage.app",
  messagingSenderId: "851657076418",
  appId: "1:851657076418:web:98089355fa63d6e63b555b",
});

const messaging = firebase.messaging();

messaging.onBackgroundMessage(function (payload) {
  self.registration.showNotification(payload.notification.title, {
    body: payload.notification.body,
  });
});
