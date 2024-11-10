imports.gi.versions.Gtk = "3.0";

const { Gtk } = imports.gi;
const utils = imports._utils;

function handleResponse(dialog, response) {
  if (response === Gtk.ResponseType.OK) {
    utils.writeColorToOutput(dialog.get_rgba());
  }

  dialog.destroy();

  Gtk.main_quit();
}

Gtk.init(null);

const colorDialog = new Gtk.ColorChooserDialog({
  title: "Select Color",
  use_alpha: true,
  modal: true,
});

colorDialog.connect("response", handleResponse);
colorDialog.show();

Gtk.main();
