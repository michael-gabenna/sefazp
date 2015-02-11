class Mdfe
  def initialize(xml_content)
    @xml_content = xml_content
  end

  def parse
    # begin
      doc = REXML::Document.new(@xml_content)
      keys = Array.new
      municipio_do_emitente = doc.elements["mdfeProc/MDFe/infMDFe/emit/enderEmit/cMun"].get_text.to_s
      municipio_de_origem = doc.elements["mdfeProc/MDFe/infMDFe/ide/infMunCarrega/cMunCarrega"].get_text.to_s
      municipio_de_destino = doc.elements["mdfeProc/MDFe/infMDFe/infDoc/infMunDescarga/cMunDescarga"].get_text.to_s
      numero = doc.elements["mdfeProc/MDFe/infMDFe/ide/nMDF"].get_text.to_s
      serie = doc.elements["mdfeProc/MDFe/infMDFe/ide/serie"].get_text.to_s
      chave_de_acesso = doc.elements["mdfeProc/MDFe/infMDFe"].attributes["Id"].to_s
      cnpj_do_emitente = doc.elements["mdfeProc/MDFe/infMDFe/emit/CNPJ"].get_text.to_s
      inscricao_estadual_do_emitente = doc.elements["mdfeProc/MDFe/infMDFe/emit/IE"].get_text.to_s
      nome_do_emitente = doc.elements["mdfeProc/MDFe/infMDFe/emit/xNome"].get_text.to_s
      nome_fantasia_do_emitente = doc.elements["mdfeProc/MDFe/infMDFe/emit/xFant"].get_text.to_s
      logradouro_do_emitente = doc.elements["mdfeProc/MDFe/infMDFe/emit/enderEmit/xLgr"].get_text.to_s
      numero_do_emitente = doc.elements["mdfeProc/MDFe/infMDFe/emit/enderEmit/nro"].get_text.to_s
      complemento_do_emitente = doc.elements["mdfeProc/MDFe/infMDFe/emit/enderEmit/xCpl"].get_text.to_s
      bairro_do_emitente = doc.elements["mdfeProc/MDFe/infMDFe/emit/enderEmit/xBairro"].get_text.to_s
      cep_do_emitente = doc.elements["mdfeProc/MDFe/infMDFe/emit/enderEmit/CEP"].get_text.to_s
      placa_do_veiculo = doc.elements["mdfeProc/MDFe/infMDFe/infModal/rodo/veicTracao/placa"].get_text.to_s
      uf_do_veiculo = doc.elements["mdfeProc/MDFe/infMDFe/infModal/rodo/veicTracao/UF"].get_text.to_s
      nome_do_motorista = doc.elements["mdfeProc/MDFe/infMDFe/infModal/rodo/veicTracao/condutor/xNome"].get_text.to_s
      cpf_do_motorista = doc.elements["mdfeProc/MDFe/infMDFe/infModal/rodo/veicTracao/condutor/CPF"].get_text.to_s
      emissao = doc.elements["mdfeProc/MDFe/infMDFe/ide/dhEmi"].get_text.to_s
      if doc.get_elements("mdfeProc/MDFe/infMDFe/infDoc/infMunDescarga/infCTe")
        doc.get_elements("mdfeProc/MDFe/infMDFe/infDoc/infMunDescarga/infCTe").each do |key|
          keys << key.elements["chCTe"].get_text.to_s
        end
      end

      return {
              municipio_do_emitente: municipio_do_emitente,
              municipio_de_origem: municipio_de_origem,
              municipio_de_destino: municipio_de_destino,
              numero: numero,
              serie: serie,
              chave_de_acesso: chave_de_acesso,
              cnpj_do_emitente: cnpj_do_emitente,
              inscricao_estadual_do_emitente: inscricao_estadual_do_emitente,
              nome_do_emitente: nome_do_emitente,
              nome_fantasia_do_emitente: nome_fantasia_do_emitente,
              logradouro_do_emitente: logradouro_do_emitente,
              numero_do_emitente: numero_do_emitente,
              complemento_do_emitente: complemento_do_emitente,
              bairro_do_emitente: bairro_do_emitente,
              cep_do_emitente: cep_do_emitente,
              placa_do_veiculo: placa_do_veiculo,
              uf_do_veiculo: uf_do_veiculo,
              nome_do_motorista: nome_do_motorista,
              cpf_do_motorista: cpf_do_motorista,
              emissao: emissao,
              keys: keys
             }
    # rescue
    #   return nil
    # end
  end
end
