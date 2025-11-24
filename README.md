# Mr Incredible CPU Widget for AwesomeWM

A simple and fun CPU usage indicator widget for **AwesomeWM**, using four images (1.jpg to 4.jpg) to visualize CPU load levels. Designed to sit in your wibar next to your other system icons.



## 📁 Folder Structure

Place your widget in:

```
~/.config/awesome/mr_incredible_cpu_widget/
```

Example structure:

```
mr_incredible_cpu_widget/
├── init.lua
├── 1.jpg
├── 2.jpg
├── 3.jpg
└── 4.jpg
```

---

## ⚙️ Installation

1. Copy the folder `mr_incredible_cpu_widget` into:

```
~/.config/awesome/
```

2. Make sure your `init.lua` includes the widget code.

3. In your `rc.lua`, require the widget:

```lua
local cpu_widget = require("mr_incredible_cpu_widget")
```

4. Add the widget to your **wibar**:

```lua
mywibar:setup {
    layout = wibox.layout.align.horizontal,
    nil,
    nil,
    {
        layout = wibox.layout.fixed.horizontal,
        mywifi,
        cpu_widget, -- CPU widget here
        mytextclock,
    },
}
```

---

## 🖼 Image Loading Path

The widget automatically loads images using:

```lua
gears.filesystem.get_configuration_dir() .. "mr_incredible_cpu_widget/"
```

So no manual path changes are required.

---

## 🔄 Reloading AwesomeWM

After adding the widget:

* Press **Super + Ctrl + R**
* Or run:

```bash
awesome-client 'awesome.restart()'
```

---

## 📝 Notes

* Images `1.jpg` → `4.jpg` represent CPU usage levels from low to high
* You can replace the images with any custom artwork you like
* Update interval can be changed inside the widget code




## 🖼 Image Preview

Below are the four CPU level images used by this widget:

| Level | Image        |
| ----- | ------------ |
| 1     | ![](./1.jpg) |
| 2     | ![](./2.jpg) |
| 3     | ![](./3.jpg) |
| 4     | ![](./4.jpg) |
