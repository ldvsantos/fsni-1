function Para(elem)
  -- Adiciona alinhamento justificado para parágrafos no Word
  if FORMAT:match 'docx' then
    return pandoc.RawBlock('openxml', 
      '<w:p><w:pPr><w:jc w:val="both"/></w:pPr>' ..
      pandoc.write(pandoc.Pandoc({elem}), 'docx'):gsub('<w:p>', ''):gsub('</w:p>', '') ..
      '</w:p>')
  end
  return elem
end

return {
  {Para = Para}
}
