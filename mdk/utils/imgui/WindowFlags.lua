---@enum WindowFlags
---Documentation copied straight from
---https://oprypin.github.io/crystal-imgui/ImGui/ImGuiWindowFlags.html
local WindowFlags = {
  None = 0,
  ---Disable title-bar.
  NoTitleBar = 1 << 0,
  ---Disable user resizing with the lower-right grip.
  NoResize = 1 << 1,
  ---Disable user moving the window.
  NoMove = 1 << 2,
  ---Disable scrollbars (window can still scroll with mouse or programmatically).
  NoScrollbar = 1 << 3,
  ---Disable user vertically scrolling with mouse wheel. On child window, mouse
  ---wheel will be forwarded to the parent unless NoScrollbar is also set.
  NoScrollWithMouse = 1 << 4,
  ---Disable user collapsing window by double-clicking on it. Also referred to as
  ---Window Menu Button (e.g. within a docking node).
  NoCollapse = 1 << 5,
  ---Resize every window to its content every frame.
  AlwaysAutoResize = 1 << 6,
  ---Disable drawing background color (WindowBg, etc.) and outside border.
  ---Similar as using SetNextWindowBgAlpha(0.0f).
  NoBackground = 1 << 7,
  ---Never load/save settings in .ini file.
  NoSavedSettings = 1 << 8,
  ---Disable catching mouse, hovering test with pass through.
  NoMouseInputs = 1 << 9,
  ---Has a menu-bar.
  MenuBar = 1 << 10,
  ---Allow horizontal scrollbar to appear (off by default). You may use
  ---SetNextWindowContentSize(ImVec2(width,0.0f)); prior to calling Begin() to
  ---specify width.
  ---Read code in imgui_demo in the "Horizontal Scrolling" section.
  HorizontalScrollbar = 1 << 11,
  ---Disable taking focus when transitioning from hidden to visible state.
  NoFocusOnAppearing = 1 << 12,
  ---Disable bringing window to front when taking focus (e.g. clicking on it or
  ---programmatically giving it focus).
  NoBringToFrontOnFocus = 1 << 13,
  ---Always show vertical scrollbar (even if ContentSize.y < Size.y).
  AlwaysVerticalScrollbar = 1 << 14,
  ---Always show horizontal scrollbar (even if ContentSize.x < Size.x).
  AlwaysHorizontalScrollbar = 1 << 15,
  ---No gamepad/keyboard navigation within the window
  NoNavInputs = 1 << 16,
  ---No focusing toward this window with gamepad/keyboard navigation
  ---(e.g. skipped by CTRL+TAB)
  NoNavFocus = 1 << 17,
  ---Display a dot next to the title. When used in a tab/docking context, tab is
  ---selected when clicking the X + closure is not assumed (will wait for user
  ---to stop submitting the tab). Otherwise closure is assumed when pressing the
  ---X, so if you keep submitting the tab may reappear at end of tab bar.
  UnsavedDocument = 1 << 18,
  --Groupings
  ---NoNavInputs + NoNavFocus
  NoNav = (1 << 16) + (1 << 17),
  ---NoCollapse + NoScrollbar + NoResize + NoTitleBar
  NoDecorations = (1 << 5) + (1 << 3) + (1 << 1) + (1 << 0),
}

return WindowFlags
