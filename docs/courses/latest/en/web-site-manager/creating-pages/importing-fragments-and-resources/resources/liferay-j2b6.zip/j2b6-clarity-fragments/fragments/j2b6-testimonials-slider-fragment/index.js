let slideIndex = 0;

const slides = fragmentElement.querySelectorAll('.quotes');

const numberOfSlides = slides.length;

function getNextSlideIndex() {
	slideIndex = slideIndex + 1;

	if (slideIndex >= numberOfSlides) {
		slideIndex = 0;
	}

	return slideIndex;
}

function main() {
	setInterval(function () {
		showSlide(getNextSlideIndex());
	}, 4000);
}

function showSlide(index) {
	slides.forEach(slide => {
		slide.classList.add('d-none');
	});

	const nextSlide = slides[index];

	nextSlide.classList.remove('d-none');
}

main();
