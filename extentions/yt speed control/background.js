chrome.commands.onCommand.addListener((command) => {
  if (command === "increase-speed" || command === "decrease-speed") {
    const change = command === "increase-speed" ? 0.25 : -0.25;
    chrome.tabs.query({ active: true, currentWindow: true }, (tabs) => {
      if (tabs[0] && tabs[0].url.includes("youtube.com/watch")) {
        chrome.scripting.executeScript({
          target: { tabId: tabs[0].id },
          func: (delta) => {
            const vid = document.querySelector("video");
            if (vid) {
              let newRate = vid.playbackRate + delta;
              newRate = Math.min(4, Math.max(0.25, newRate));
              vid.playbackRate = newRate;
              console.log("Playback speed:", newRate);
            }
          },
          args: [change]
        });
      }
    });
  }
});
