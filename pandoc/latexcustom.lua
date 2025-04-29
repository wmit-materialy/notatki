function Writer (doc, opts)
  local includes_tmpl = pandoc.template.compile('$header-includes$')
  local vars = {['header-includes'] = opts.variables['header-includes'] or ''}

  -- Write header-includes, once with variables, once without (thus
  -- allowing metadata values to be used instead)
  opts.variables['header-includes'] =
    pandoc.write(doc, 'latex', {template=includes_tmpl, variables=vars}) ..
    '\n' ..
    pandoc.write(doc, 'latex', {template=includes_tmpl})

  return pandoc.write(doc, 'latex', opts)
end
