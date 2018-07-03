(function () {
    //setTimeout(function () {
        var getAnchors = $("img");

        for (var i = 0; i < getAnchors.length; i++) {
            var canvas = convertImageToCanvas(getAnchors[i]);
            var theURL = canvas.toDataURL("image/webp", 100);
            getAnchors[i].src = theURL;
        }
    //}, 500);
})();

function convertImageToCanvas(image) {
    var canvas = document.createElement("canvas");
    canvas.width = image.naturalWidth;
    canvas.height = image.naturalHeight;
    canvas.getContext("2d").drawImage(image, 0, 0);

    return canvas;
}
