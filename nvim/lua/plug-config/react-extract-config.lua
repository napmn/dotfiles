require("react-extract").setup({
  -- ts_template_before =
  --   "type [COMPONENT_NAME]Props = {\n[TYPE_PROPERTIES]}\n[EMPTY_LINE]\n"
  --   .. "export class [COMPONENT_NAME] extends React.Component<[COMPONENT_NAME]Props> {\n"
  --   .. "[INDENT]constructor(props: [COMPONENT_NAME]Props) {\n"
  --   .. "[INDENT][INDENT]super(props)\n"
  --   .. "[INDENT]}\n[EMPTY_LINE]\n"
  --   .. "[INDENT]render() {\n[INDENT][INDENT]return (\n",
  -- ts_template_after = "[INDENT][INDENT])\n[INDENT]}\n}",
  -- jsx_indent_level = 3,
  -- use_class_props = true
})
