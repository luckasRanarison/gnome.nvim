const { Notify } = imports.gi;

const [level, message] = ARGV;

const levels = {
  TRACE: 0,
  DEBUG: 1,
  INFO: 2,
  WARN: 3,
  ERROR: 4,
  OFF: 5,
};

const levelNameMap = {
  [levels.TRACE]: "trace",
  [levels.DEBUG]: "debug",
  [levels.INFO]: "info",
  [levels.WARN]: "warning",
  [levels.ERROR]: "error",
};

Notify.init("Neovim");

const levelStr = levelNameMap[level];
const title = levelStr.slice(0, 1).toUpperCase() + levelStr.slice(1);
const notification = Notify.Notification.new(title, message, levelStr);

notification.show();
