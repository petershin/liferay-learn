const announcementBanner = fragmentElement.querySelector(
	'.announcement-banner',
);
const closeButton = fragmentElement.querySelector(
	'.announcement-banner-close-button',
);

if (localStorage.getItem('announcementClosed') !== 'true') {
	announcementBanner.classList.remove('hide');
}

closeButton.addEventListener('click', function () {
	announcementBanner.classList.add('hide');
	localStorage.setItem('announcementClosed', 'true');
});
