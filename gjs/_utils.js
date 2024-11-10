function writeColorToOutput(rgba) {
  const { red, green, blue, alpha } = rgba;
  const result = { red, green, blue, alpha };

  for (const key in result) {
    result[key] = Math.round(result[key] * 255);
  }

  print(JSON.stringify(result));
}
