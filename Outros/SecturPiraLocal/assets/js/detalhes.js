let currentImageIndex = 0;


function openLightbox(index) {
    currentImageIndex = index;
    const lightbox = document.querySelector('.lightbox');
    const lightboxImage = document.querySelector('.lightbox-image');
    lightboxImage.src = images[index];
    lightbox.style.display = 'block';
}

function closeLightbox() {
    document.querySelector('.lightbox').style.display = 'none';
}

function prevImage() {
    if (currentImageIndex > 0) {
        currentImageIndex--;
        openLightbox(currentImageIndex);
    }
}

function nextImage() {
    if (currentImageIndex < images.length - 1) {
        currentImageIndex++;
        openLightbox(currentImageIndex);
    }
}
