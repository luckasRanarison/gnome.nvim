imports.gi.versions.Gtk = "4.0";

const { Gtk, Gdk, Gio, GObject } = imports.gi;
const utils = imports._utils;

class _Application extends Gtk.Application {
  vfunc_activate() {
    const win = new Gtk.ApplicationWindow({ application: this });
    const colorDialog = Gtk.ColorDialog.new();
    const initialColor = new Gdk.RGBA({ red: 1, green: 1, blue: 1 });
    const cancellable = new Gio.Cancellable();

    colorDialog.set_modal(true);
    colorDialog.choose_rgba(win, initialColor, cancellable, (dialog, res) => {
      try {
        const rgba = dialog.choose_rgba_finish(res);
        utils.writeColorToOutput(rgba);
      } catch (_) {}

      this.quit();
    });
  }
}

const Application = GObject.registerClass(
  { GTypeName: "ColorApp" },
  _Application,
);

const app = new Application();

app.run([]);
