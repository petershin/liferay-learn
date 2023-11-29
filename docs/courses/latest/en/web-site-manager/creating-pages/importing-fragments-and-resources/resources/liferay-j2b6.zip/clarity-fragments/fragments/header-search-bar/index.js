const openSearchIcon = fragmentElement.querySelector('.js-open-search');
const closeSearchIcon = fragmentElement.querySelector('.js-close-search');
const searchBar = fragmentElement.querySelector('.clarity-search-bar');

openSearchIcon.addEventListener('click', function () {
    closeSearchIcon.style.display = 'block';
    openSearchIcon.style.display = 'none';
    searchBar.style.display = 'block';
});

closeSearchIcon.addEventListener('click', function () {
    closeSearchIcon.style.display = 'none';
    openSearchIcon.style.display = 'block';
    searchBar.style.display = 'none';
});
