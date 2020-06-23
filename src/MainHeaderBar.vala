[GtkTemplate (ui = "/com/bitstower/Markets/MainHeaderBar.ui")]
public class Markets.MainHeaderBar : Hdy.HeaderBar {

	[GtkChild]
	Gtk.MenuButton menuBtn;

	[GtkChild]
	Gtk.Button addBtn;

	[GtkChild]
	Gtk.Button selectBtn;

    private Gtk.ApplicationWindow parentWindow;
    private Markets.Model model;

    public MainHeaderBar (Gtk.ApplicationWindow parentWindow, Markets.Model model) {
        Object ();

        this.parentWindow = parentWindow;
        this.model = model;

        var builder1 = new Gtk.Builder.from_resource("/com/bitstower/Markets/menu.ui");
        var main_menu = (GLib.MenuModel) builder1.get_object("main-menu");
        menuBtn.set_menu_model(main_menu);

        addBtn.clicked.connect (this.onAddClicked);
        selectBtn.clicked.connect (this.onSelectClicked);
    }

    private void onAddClicked () {
        var dialog = new Markets.NewSymbolDialog (this.parentWindow);
        dialog.run ();
        dialog.destroy ();
    }

    private void onSelectClicked () {
        this.model.selectionEnabled = true;
    }
}