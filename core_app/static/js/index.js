/**
 * @fileoverview This contains the javascript logic for the index.html page
 *
 * @author Nikolai Alexander
 * @email njalexander93@gmail.com
 * @version 1.0.0
 * @date TBD
 * @license CC BY-ND 4.0
 * @copyright Copyright (c) 2023 Nikolai Alexander
 */


/**
 * This helper function runs the photo fade-in animation.
 * @return {void}
 */
function triggerPhotoLoadAnimationHelper(professionalPhotoContainer) {
    return function() {
        professionalPhotoContainer.style.opacity = "1";
        professionalPhotoContainer.style.transform = "scale(1)";
        professionalPhotoContainer.style.transition = "opacity  0.7s ease-in-out, transform 0.7s ease-in-out";
    }
}

/**
 * This function triggers the Photo animation defined in index.css after the image is loaded.
 * @return {void}
 */
function triggerPhotoLoadAnimation () {
    var professionalPhoto = document.getElementById("professional-photo");
    var professionalPhotoContainer = document.getElementById("professional-photo-container");

    professionalPhotoContainer.style.opacity = "0";
    professionalPhotoContainer.style.transform = "scale(0.5)";

    var loadAnimationHelper = triggerPhotoLoadAnimationHelper(professionalPhotoContainer);
    professionalPhoto.addEventListener("load", loadAnimationHelper);
    setTimeout(loadAnimationHelper, 300); // An extra initiator if the image is already loaded and the event listener above doesn't trigger.
}


/**
 * This function triggers the title load animation.
 * @return {void}
 */
function triggerTitleLoadAnimation () {
    var titleText = document.getElementById("title-header");
    titleText.classList.add("loaded");
}


/**
 * This function enables the fade-in animation for the next header message.
 * @param {HTMLElement} currentHeader - The current displayed header message.
 * @param {string} nextMessage - The next message to be displayed.
 * @return {function} - A function fades in the next message. To be used within setTimeout to delay the display.
 */
function fadeInNextMessageHelper(currentHeader, nextMessage) {
    return function() {
        // Set the next message.
        currentHeader.innerText = nextMessage;

        currentHeader.style.opacity = 1;
        currentHeader.style.transition = "opacity 1s ease";
    }
}


/**
 * This function rotates between messages in the header list to add some animation to the display.
 * @param {HTMLElement} currentHeader - The current displayed header message.
 * @param {string[]} headerList - The list of header messages to display.
 * @return {function} - A function that rotates the messages. This is to by used in setInterval.
 */
function displayHeaderMessageHelper(currentHeader, headerList) {
    return function() {
        var currentMessage = currentHeader.innerText;
        var currentIdx = headerList.indexOf(currentMessage);

        // Queue up the next message.
        var nextIdx = (currentIdx + 1) % headerList.length;
        var nextMessage = headerList[nextIdx];

        // Fade out the current message.
        currentHeader.style.opacity = 0;
        currentHeader.style.transition = "opacity 0.5s ease";

        var fadeInHelper = fadeInNextMessageHelper(currentHeader, nextMessage);
        setTimeout(fadeInHelper, 700);
    }
}


/**
 * This function displays the header message within the index.html page.
 * @return {void}
 */
function displayHeaderMessage() {
    var headerList = [
        "Passionate about DevOps and Resilient Solutions",
        "SAFe® Agile Scrum Master",
        "Inspiring Excellence and Empowering Teams"
    ]
    var startIdx = Math.floor(Math.random() * headerList.length);

    // Initialize the first message.
    var headerMessage = document.getElementById("header-message");
    headerMessage.innerText = headerList[startIdx];
    fadeInNextMessageHelper(headerMessage, headerList[startIdx])();

    // Rotate between the messages at an interval of 3 seconds between each message.
    var displayHelper = displayHeaderMessageHelper(headerMessage, headerList);
    setInterval(displayHelper, 5000)
}


/**
 * This function is the main function that orchestrates all of the load animations.
 * @return {void}
 */
function triggerLoadAnimations() {
    triggerPhotoLoadAnimation();

    setTimeout(triggerTitleLoadAnimation, 500);

    setTimeout(displayHeaderMessage, 1000);
}


window.addEventListener("DOMContentLoaded", triggerLoadAnimations);
