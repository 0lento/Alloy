using UnityEditor;
using UnityEngine;

public static class AlloyMenuGroups {
    [MenuItem(AlloyUtils.MenuItem + "Documentation", false, 100)]
    static void Documentation() {
        Application.OpenURL("http://www.alloy.rustltd.com/docs/");
    }

    [MenuItem(AlloyUtils.MenuItem + "About", false, 100)]
    static void About() {
        Application.OpenURL("https://alloy.rustltd.com/");
    }
}
