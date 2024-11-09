imports.gi.versions.Gtk = "3.0";

const { Gtk } = imports.gi;

Gtk.init(null);

const colorDialog = new Gtk.ColorChooserDialog({
  title: "Select Color",
  use_alpha: true,
});

colorDialog.connect("response", (dialog, response) => {
  if (response === Gtk.ResponseType.OK) {
    const { red, green, blue, alpha } = colorDialog.get_rgba();
    const rgba = { red, green, blue, alpha };

    for (const [key, value] of Object.entries(rgba)) {
      rgba[key] = Math.round(value * 255);
    }

    const json = JSON.stringify(rgba);

    print(json);
  }

  dialog.destroy();

  Gtk.main_quit();
});

colorDialog.show();

Gtk.main();
