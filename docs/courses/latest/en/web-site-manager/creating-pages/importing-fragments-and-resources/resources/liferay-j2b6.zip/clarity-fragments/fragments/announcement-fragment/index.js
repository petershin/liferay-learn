const announcementBanner = fragmentElement.querySelector('.announcement-banner');
const closeButton = fragmentElement.querySelector('.announcement-banner-close-button');

if (localStorage.getItem('announcementClosed') !== 'true') {
    announcementBanner.classList.remove('d-none');
}

closeButton.addEventListener('click', function () {
    announcementBanner.classList.add('d-none');
    localStorage.setItem('announcementClosed', 'true');
});