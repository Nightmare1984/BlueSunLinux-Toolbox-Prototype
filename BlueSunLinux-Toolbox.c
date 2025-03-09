#include <gtk/gtk.h>
#include <stdlib.h>

// Function to handle the button click
void button_clicked(GtkWidget *widget, gpointer data) {
    // Run the script
    system("./Scripts/mouse-latency-reducer.sh");

    // Get the text buffer
    GtkTextBuffer *buffer = gtk_text_view_get_buffer(GTK_TEXT_VIEW(data));

    // Insert the text
    gtk_text_buffer_insert_at_cursor(buffer, "Reducing mouse latency...\n", -1);
}

int main(int argc, char *argv[]) {
    // Initialize GTK
    gtk_init(&argc, &argv);

    // Create a new window
    GtkWidget *window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title(GTK_WINDOW(window), "BlueSunLinux-Toolbox");
    gtk_window_set_default_size(GTK_WINDOW(window), 300, 200);

    // Create a box to contain the text view and button
    GtkWidget *box = gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_container_add(GTK_CONTAINER(window), box);

    // Create a new text view
    GtkWidget *textView = gtk_text_view_new();
    gtk_box_pack_start(GTK_BOX(box), textView, TRUE, TRUE, 0);

    // Create a new button
    GtkWidget *button = gtk_button_new_with_label("Run Script");
    gtk_box_pack_start(GTK_BOX(box), button, FALSE, FALSE, 0);

    // Connect the button click signal to our function
    g_signal_connect(button, "clicked", G_CALLBACK(button_clicked), textView);

    // Show all widgets
    gtk_widget_show_all(window);

    // Start the GTK main loop
    gtk_main();

    return 0;
}

