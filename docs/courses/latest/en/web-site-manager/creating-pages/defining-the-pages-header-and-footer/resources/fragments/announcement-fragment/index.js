document.addEventListener("DOMContentLoaded", function() {
    handleAnnouncementBanner();
});

Liferay.on('endNavigate', function() {
    handleAnnouncementBanner();
});

function handleAnnouncementBanner() {
    const announcementBanner = document.getElementById("announcement");
    const closeButton = document.getElementById("closeAnnouncement");

    if (!announcementBanner || !closeButton) {
        return;
    }

    if (localStorage.getItem("announcementClosed") !== "true") {
        announcementBanner.classList.remove("announcement-banner-hidden");
        announcementBanner.classList.add("announcement-banner-visible");
    } else {
        announcementBanner.classList.remove("announcement-banner-visible");
        announcementBanner.classList.add("announcement-banner-hidden");
    }

    closeButton.addEventListener("click", function() {
        announcementBanner.classList.remove("announcement-banner-visible");
        announcementBanner.classList.add("announcement-banner-hidden");
        localStorage.setItem("announcementClosed", "true");
    });
}
