chrome.storage.local.get("ytSpeed", ({ ytSpeed }) => {
  const vid = document.querySelector("video");
  if (vid && ytSpeed) {
    vid.playbackRate = ytSpeed;
  }
});
