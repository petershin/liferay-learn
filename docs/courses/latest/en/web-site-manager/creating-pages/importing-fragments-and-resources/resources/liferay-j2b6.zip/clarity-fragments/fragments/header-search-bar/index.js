const openSearchIcon = fragmentElement.querySelector('.js-open-search');
const closeSearchIcon = fragmentElement.querySelector('.js-close-search');
const searchBar = fragmentElement.querySelector('.clarity-search-bar');

openSearchIcon.addEventListener('click', function () {
	closeSearchIcon.classList.add('d-block');
	closeSearchIcon.classList.remove('d-none');
	
	openSearchIcon.classList.add('d-none');
	openSearchIcon.classList.remove('d-block');
	
	searchBar.classList.add('d-block');
	searchBar.classList.remove('d-none');
});

closeSearchIcon.addEventListener('click', function () {
	closeSearchIcon.classList.add('d-none');
	closeSearchIcon.classList.remove('d-block');	
	
	openSearchIcon.classList.add('d-block');
	openSearchIcon.classList.remove('d-none');
	
	searchBar.classList.add('d-none');
	searchBar.classList.remove('d-block');
});
