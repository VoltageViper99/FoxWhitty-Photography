# FoxWhitty Photography

Internal notes for the FoxWhitty Photography website.

## Overview

This is a static photography website built with HTML, CSS, and JavaScript. It includes pages for information, gallery collections, and enquiries.

The current gallery categories are:

- Nature
- Beaches
- Animals
- Plants

## Project structure

```text
.
├── index.html          # Home page
├── about.html          # About page
├── gallery.html        # Gallery index
├── contact.html        # Contact form
├── galleries/          # Individual gallery pages
├── css/style.css       # Shared styles
├── js/menu.js          # Mobile navigation
├── js/form.js          # Contact form handling
└── images/             # Website images
```


## Updating a gallery

1. Add the new WebP image to the matching folder under `images/gallery/`.
2. Add the image to the relevant HTML file under `galleries/`.
3. Give the image clear alternative text.
4. Check the page on both desktop and mobile screen sizes.

Use lowercase filenames with hyphens instead of spaces.

## Notes

- The navigation menu is shared manually across the HTML pages.
- Font Awesome is loaded from a CDN.
- The contact form is submitted through Web3Forms.
- There is no build step or package manager.

## Copyright

All photographs and website content are copyright FoxWhitty Photography. All rights reserved.
