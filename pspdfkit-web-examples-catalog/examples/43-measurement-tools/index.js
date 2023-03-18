import PSPDFKit from "pspdfkit";

export function load(defaultConfiguration) {
  PSPDFKit.load({
    ...defaultConfiguration,
    toolbarItems: [
      ...PSPDFKit.defaultToolbarItems,
      { type: "distance" },
      { type: "perimeter" },
      { type: "rectangle-area" },
      { type: "polygon-area" },
      { type: "ellipse-area" },
    ],
  }).then((instance) => {
    window.instance = instance;
  });
}
