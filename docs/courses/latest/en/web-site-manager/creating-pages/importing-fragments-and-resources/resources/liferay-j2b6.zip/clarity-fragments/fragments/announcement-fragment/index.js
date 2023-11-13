const announcementBanner = document.getElementById("announcement");
const closeButton = document.getElementById("closeAnnouncement");

if (localStorage.getItem("announcementClosed") !== "true") {
    announcementBanner.classList.remove("hide");
}

closeButton.addEventListener("click", function() {
    announcementBanner.classList.add("hide");
    localStorage.setItem("announcementClosed", "true");
});