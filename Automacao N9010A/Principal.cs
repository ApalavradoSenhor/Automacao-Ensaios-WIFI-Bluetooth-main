using MatheusProductions.AutomacaoN9010A;
using System;
using System.Windows.Forms;
using MatheusProductions.KeysightLib;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.IO;
using Microsoft.WindowsAPICodePack.Dialogs;


namespace Automacao_N9010A
{


    public partial class Principal : Form
    {

        public string NomePasta { get; set; }
        public string NomeEnsaio { get; set; }
        public string NomeMetrologista { get; set; }
        string RefLevel { get; set; }
        string Att { get; set; }
        string Marca { get; set; }
        readonly string caminhoJson = System.AppDomain.CurrentDomain.BaseDirectory.ToString();
        string jsonString;
        readonly FileStream json;
        Save salva;
        TelaLoading tl;
        AutomacaoN9010A radical;
        Configurações config;
        Item_10 it10;
        Item_11 it11;
        Item_12 it12;


        public Principal()
        {
            InitializeComponent();
            if (!System.IO.File.Exists(caminhoJson + @"\" + "save.json"))
            {
                json = Keysight.CriaArquivoSemSenha("save.json", caminhoJson);
                json.Close();
                caminhoJson = System.IO.Path.Combine(caminhoJson, "save.json");
                jsonString =
                @"{
                  ""EnsaiosItem10"": [
                    false,
                    false,
                    false,
                    false,
                    false,
                    false,
                    false
                    ],
                  ""EnsaiosItem11"": [
                    false,
                    false,
                    false,
                    false,
                    false,
                    false,
                    false
                    ],
                  ""EnsaiosItem12"": [
                    false,
                    false,
                    false
                    ],
                  ""RefLevel"": ""10"",
                  ""Att"": ""35"",
                  ""Marca"": ""NA"",
                  ""AtivarPrints"": true,
                  ""SelTipo"": 0,
                  ""FreqEspuriosWifi"": [
                    ""30"",
                    ""2402"",
                    ""2480"",
                    ""18000""
                    ],
                  ""FreqEspuriosBT"": [
                    ""30"",
                    ""2402"",
                    ""2480"",
                    ""18000""
                    ],
                  ""FreqNumeroCanaisDeSalto"": [
                    ""2400"",
                    ""2400.5"",
                    ""2483.5""
                    ]
                }
                ";
                File.WriteAllText(caminhoJson, jsonString);

            }
            else
            {
                caminhoJson = System.IO.Path.Combine(caminhoJson, "save.json");
                CBSelTipo.SelectedIndex = CarregaTipo();
                if (CBSelTipo.SelectedItem.Equals("Wifi"))
                {
                    GridFreqWifi.Visible = true;
                    GridFreqBt.Visible = false;
                }
                else
                {
                    GridFreqWifi.Visible = false;
                    GridFreqBt.Visible = true;
                }
            }
        }

        #region Carrega/Salva
        public void SalvaEnsaios11(bool EstadoEnsaio, int i)
        {
            jsonString = File.ReadAllText(caminhoJson);
            salva = JsonSerializer.Deserialize<Save>(jsonString);

            salva.EnsaiosItem11[i] = EstadoEnsaio;
            string novoSave = JsonSerializer.Serialize(salva);
            File.WriteAllText(caminhoJson, novoSave);
        }

        public bool CarregaEnsaios11(int i)
        {
            jsonString = File.ReadAllText(caminhoJson);
            salva = JsonSerializer.Deserialize<Save>(jsonString);

            return salva.EnsaiosItem11[i];
        }

        public string CarregaFreqEspuriosWifi(int i)
        {
            jsonString = File.ReadAllText(caminhoJson);
            salva = JsonSerializer.Deserialize<Save>(jsonString);

            return salva.FreqEspuriosWifi[i];
        }

        public string CarregaFreqEspuriosBt(int i)
        {
            jsonString = File.ReadAllText(caminhoJson);
            salva = JsonSerializer.Deserialize<Save>(jsonString);

            return salva.FreqEspuriosBT[i];
        }

        public string CarregaFreqNCS(int i)
        {
            jsonString = File.ReadAllText(caminhoJson);
            salva = JsonSerializer.Deserialize<Save>(jsonString);

            return salva.FreqNumeroCanaisDeSalto[i];
        }

        public void SalvaTipo()
        {
            jsonString = File.ReadAllText(caminhoJson);
            salva = JsonSerializer.Deserialize<Save>(jsonString);

            salva.SelTipo = CBSelTipo.SelectedIndex;
            string novoSave = JsonSerializer.Serialize(salva);
            File.WriteAllText(caminhoJson, novoSave);
        }

        public int CarregaTipo()
        {
            jsonString = File.ReadAllText(caminhoJson);
            salva = JsonSerializer.Deserialize<Save>(jsonString);

            return salva.SelTipo;
        }

        public bool CarregaEnsaios10(int i)
        {
            jsonString = File.ReadAllText(caminhoJson);
            salva = JsonSerializer.Deserialize<Save>(jsonString);

            return salva.EnsaiosItem10[i];
        }

        public void SalvaEnsaios10(bool EstadoEnsaio, int i)
        {
            jsonString = File.ReadAllText(caminhoJson);
            salva = JsonSerializer.Deserialize<Save>(jsonString);

            salva.EnsaiosItem10[i] = EstadoEnsaio;
            string novoSave = JsonSerializer.Serialize(salva);
            File.WriteAllText(caminhoJson, novoSave);
        }

        public void SalvaEnsaios12(bool EstadoEnsaio, int i)
        {
            jsonString = File.ReadAllText(caminhoJson);
            salva = JsonSerializer.Deserialize<Save>(jsonString);

            salva.EnsaiosItem12[i] = EstadoEnsaio;
            string novoSave = JsonSerializer.Serialize(salva);
            File.WriteAllText(caminhoJson, novoSave);
        }

        public bool CarregaEnsaios12(int i)
        {
            jsonString = File.ReadAllText(caminhoJson);
            salva = JsonSerializer.Deserialize<Save>(jsonString);

            return salva.EnsaiosItem12[i];
        }

        public void SalvaConfig(string refL, string att, bool gPrints, string marca)
        {
            jsonString = File.ReadAllText(caminhoJson);
            salva = JsonSerializer.Deserialize<Save>(jsonString);

            salva.RefLevel = refL;
            salva.Marca = marca;
            salva.Att = att;
            salva.AtivarPrints = gPrints;
            string novoSave = JsonSerializer.Serialize(salva);
            File.WriteAllText(caminhoJson, novoSave);
        }


        public void SalvaConfigNCS(string freqInicial, string freqMeio, string freqFinal)
        {
            jsonString = File.ReadAllText(caminhoJson);
            salva = JsonSerializer.Deserialize<Save>(jsonString);

            salva.FreqNumeroCanaisDeSalto[0] = freqInicial;
            salva.FreqNumeroCanaisDeSalto[1] = freqMeio;
            salva.FreqNumeroCanaisDeSalto[2] = freqFinal;
            string novoSave = JsonSerializer.Serialize(salva);
            File.WriteAllText(caminhoJson, novoSave);
        }

        public void SalvaConfigEspurios(string CB, string freqInicial, string freqFinal, string canalInicial, string canalFinal)
        {
            jsonString = File.ReadAllText(caminhoJson);
            salva = JsonSerializer.Deserialize<Save>(jsonString);

            if (CB == "WIFI")
            {
                salva.FreqEspuriosWifi[0] = freqInicial;
                salva.FreqEspuriosWifi[1] = canalInicial;
                salva.FreqEspuriosWifi[2] = canalFinal;
                salva.FreqEspuriosWifi[3] = freqFinal;
                string novoSave = JsonSerializer.Serialize(salva);
                File.WriteAllText(caminhoJson, novoSave);
            }
            else
            {
                salva.FreqEspuriosBT[0] = freqInicial;
                salva.FreqEspuriosBT[1] = canalInicial;
                salva.FreqEspuriosBT[2] = canalFinal;
                salva.FreqEspuriosBT[3] = freqFinal;
                string novoSave = JsonSerializer.Serialize(salva);
                File.WriteAllText(caminhoJson, novoSave);
            }

        }
        public string CarregaAtt()
        {
            jsonString = File.ReadAllText(caminhoJson);
            salva = JsonSerializer.Deserialize<Save>(jsonString);

            return salva.Att;
        }

        public string CarregaMarca()
        {
            jsonString = File.ReadAllText(caminhoJson);
            salva = JsonSerializer.Deserialize<Save>(jsonString);

            return salva.Marca;
        }

        public string CarregaRefLevel()
        {
            jsonString = File.ReadAllText(caminhoJson);
            salva = JsonSerializer.Deserialize<Save>(jsonString);

            return salva.RefLevel;
        }

        public bool CarregaAPrints()
        {
            jsonString = File.ReadAllText(caminhoJson);
            salva = JsonSerializer.Deserialize<Save>(jsonString);

            return salva.AtivarPrints;
        }
        #endregion


        private bool CriaPasta()
        {
            if (!Directory.Exists(NomePasta + @"\" + NomeEnsaio))
            {
                Directory.CreateDirectory(NomePasta + @"\" + NomeEnsaio);
                NomePasta = NomePasta + @"\" + NomeEnsaio;
                return true;
            }
            else
            {
                NomePasta = NomePasta + @"\" + NomeEnsaio;
                return true;
            }
        }
        public void Ensaio_Tempo_de_Ocupação(string valFreq, string ip, string ensaioAtual, bool prints)
        {
            radical = new AutomacaoN9010A();
            Att = CarregaAtt();
            RefLevel = CarregaRefLevel();
            Marca = config.GetMarca();
            if (Marca != "NA")
            {
                if (radical.TempoDeOcupacao(valFreq, ip, "2", RefLevel, Att, Marca))
                {
                    DialogResult dialogResult = DialogResult.No;
                    while (dialogResult == DialogResult.No)
                    {
                        radical.TempoDeOcupacao(valFreq, ip, "2", RefLevel, Att, Marca);
                        dialogResult = MessageBox.Show("Tudo certo ai, chefia?", "Aviso", MessageBoxButtons.YesNo);
                    }
                    radical.TiraPrint(valFreq, ip, ensaioAtual, prints, Marca, NomePasta, "TempoDeOcupacao");
                    radical.GetMarkersTempo(valFreq, ensaioAtual, Marca, ip, NomePasta);
                }
            }
        }

        public void Ensaio_Numero_de_Ocupações(string valFreq, string ip, string ensaioAtual, bool prints)
        {
            radical = new AutomacaoN9010A();
            Att = CarregaAtt();
            RefLevel = CarregaRefLevel();
            Marca = config.GetMarca();
            int numMarkers = 0;
            if (Marca != "NA")
            {
                if (radical.NumeroDeOcupacoes(valFreq, ip, "2", RefLevel, Att, Marca, ref numMarkers, NomePasta))
                radical.TiraPrint(valFreq, ip, ensaioAtual, prints, Marca, NomePasta, "NumeroDeOcupacoes");
                radical.GetMarkersNmrOcu(valFreq, ensaioAtual, Marca, ip, numMarkers, NomePasta);
            }
        }

        private void BtConfirmar_Click(object sender, EventArgs e)
        {
            RefLevel = CarregaRefLevel();
            Att = CarregaAtt();
            Marca = CarregaMarca();
            tl = new TelaLoading();
            config = new Configurações();
            it11 = new Item_11();
            it12 = new Item_12();
            it10 = new Item_10();
            jsonString = File.ReadAllText(caminhoJson);
            salva = JsonSerializer.Deserialize<Save>(jsonString);
            if (GridFreqBt.Rows.Count != 0 || GridFreqWifi.Rows.Count != 0)
            {
                if (LConecta.Text == "CONECTADO")
                {
                    if (GridFreqWifi.Rows.Count != 0 && GridFreqBt.Rows.Count == 0)
                    {
                        if (CriaPasta())
                        {
                            tl.Show();
                            for (int i = 0; i < GridFreqWifi.Rows.Count; i++)
                            {
                                MessageBox.Show($"Iniciando o Ensaio do {GridFreqWifi.Rows[i].Cells[0].Value} - {GridFreqWifi.Rows[i].Cells[1].Value}, configure o aparelho");
                                if (salva.EnsaiosItem11[0] == true)
                                {
                                    radical.Largura_6dB(GridFreqWifi.Rows[i].Cells[0].Value.ToString(), TextBoxIP.Text, GridFreqWifi.Rows[i].Cells[1].Value.ToString(), GridFreqWifi.Rows[i].Cells[2].Value.ToString(), RefLevel, Att, ((bool?)GridFreqWifi.Rows[i].Cells[3].Value) ?? false, Marca, NomePasta);
                                    tl.SetValorPB((100 / it11.GetQuantidadeEnsaios()) / GridFreqWifi.Rows.Count);
                                }
                                if (salva.EnsaiosItem11[1] == true)
                                {
                                    radical.Largura_26dB(GridFreqWifi.Rows[i].Cells[0].Value.ToString(), TextBoxIP.Text, GridFreqWifi.Rows[i].Cells[1].Value.ToString(), GridFreqWifi.Rows[i].Cells[2].Value.ToString(), RefLevel, Att, ((bool?)GridFreqWifi.Rows[i].Cells[3].Value) ?? false, Marca, NomePasta);
                                    tl.SetValorPB((100 / it11.GetQuantidadeEnsaios()) / GridFreqWifi.Rows.Count);
                                }
                                if (salva.EnsaiosItem11[2] == true)
                                {
                                    radical.Potência_de_pico_máxima(GridFreqWifi.Rows[i].Cells[0].Value.ToString(), TextBoxIP.Text, GridFreqWifi.Rows[i].Cells[1].Value.ToString(), GridFreqWifi.Rows[i].Cells[2].Value.ToString(), RefLevel, Att, ((bool?)GridFreqWifi.Rows[i].Cells[3].Value) ?? false, Marca, NomePasta);
                                    tl.SetValorPB((100 / it11.GetQuantidadeEnsaios()) / GridFreqWifi.Rows.Count);
                                }
                                if (salva.EnsaiosItem11[3] == true)
                                {
                                    radical.Valor_médio_da_potência_máxima_de_saída(GridFreqWifi.Rows[i].Cells[0].Value.ToString(), TextBoxIP.Text, GridFreqWifi.Rows[i].Cells[1].Value.ToString(), GridFreqWifi.Rows[i].Cells[2].Value.ToString(), RefLevel, Att, ((bool?)GridFreqWifi.Rows[i].Cells[3].Value) ?? false, Marca, NomePasta);
                                    tl.SetValorPB((100 / it11.GetQuantidadeEnsaios()) / GridFreqWifi.Rows.Count);
                                }
                                if (salva.EnsaiosItem11[4] == true)
                                {
                                    radical.Pico_da_densidade_de_potência(GridFreqWifi.Rows[i].Cells[0].Value.ToString(), TextBoxIP.Text, GridFreqWifi.Rows[i].Cells[1].Value.ToString(), GridFreqWifi.Rows[i].Cells[2].Value.ToString(), RefLevel, Att, ((bool?)GridFreqWifi.Rows[i].Cells[3].Value) ?? false, Marca, NomePasta);
                                    tl.SetValorPB((100 / it11.GetQuantidadeEnsaios()) / GridFreqWifi.Rows.Count);
                                }
                                if (salva.EnsaiosItem11[5] == true)
                                {
                                    radical.Valor_médio_da_densidade_espectral_de_potência(GridFreqWifi.Rows[i].Cells[0].Value.ToString(), TextBoxIP.Text, GridFreqWifi.Rows[i].Cells[1].Value.ToString(), GridFreqWifi.Rows[i].Cells[2].Value.ToString(), RefLevel, Att, ((bool?)GridFreqWifi.Rows[i].Cells[3].Value) ?? false, Marca, NomePasta);
                                    tl.SetValorPB((100 / it11.GetQuantidadeEnsaios()) / GridFreqWifi.Rows.Count);
                                }
                                if (salva.EnsaiosItem11[6] == true)
                                {
                                    for (int j = 0; j < 4; j++)
                                    {
                                        switch (j)
                                        {
                                            case 0:
                                                MessageBox.Show("Selecione no aparelho a frequencia Inicial");
                                                radical.Espurios(salva.FreqEspuriosWifi[0], salva.FreqEspuriosWifi[1], TextBoxIP.Text, GridFreqWifi.Rows[j].Cells[1].Value.ToString(), RefLevel, Att, ((bool?)GridFreqWifi.Rows[j].Cells[3].Value) ?? false, Marca,  NomePasta);
                                                break;
                                            case 1:
                                                radical.Espurios(Convert.ToString(Convert.ToInt32(salva.FreqEspuriosWifi[1]) - 100), salva.FreqEspuriosWifi[1], TextBoxIP.Text, GridFreqWifi.Rows[j].Cells[1].Value.ToString(), RefLevel, Att, ((bool?)GridFreqWifi.Rows[j].Cells[3].Value) ?? false, Marca, NomePasta);
                                                break;
                                            case 2:
                                                MessageBox.Show("Selecione no aparelho a frequencia final");
                                                radical.Espurios(salva.FreqEspuriosWifi[2], Convert.ToString(100 + Convert.ToInt32(salva.FreqEspuriosWifi[2])), TextBoxIP.Text, GridFreqWifi.Rows[j].Cells[1].Value.ToString(), RefLevel, Att, ((bool?)GridFreqWifi.Rows[j].Cells[3].Value) ?? false, Marca, NomePasta);
                                                break;
                                            case 3:
                                                radical.Espurios(salva.FreqEspuriosWifi[2], salva.FreqEspuriosWifi[3], TextBoxIP.Text, GridFreqWifi.Rows[j].Cells[1].Value.ToString(), RefLevel, Att, ((bool?)GridFreqWifi.Rows[j].Cells[3].Value) ?? false, Marca,  NomePasta);
                                                MessageBox.Show("Terminando ensaio de Espurios, volte pra frequencia de ensaio");
                                                break;

                                        }
                                    }
                                    tl.SetValorPB((100 / it11.GetQuantidadeEnsaios()) / GridFreqWifi.Rows.Count);
                                }
                                if (salva.EnsaiosItem12[0] == true)
                                {
                                    radical.Potencia_De_Saida(GridFreqWifi.Rows[i].Cells[0].Value.ToString(), TextBoxIP.Text, GridFreqWifi.Rows[i].Cells[1].Value.ToString(), GridFreqWifi.Rows[i].Cells[2].Value.ToString(), RefLevel, Att, ((bool?)GridFreqWifi.Rows[i].Cells[3].Value) ?? false, Marca, NomePasta);
                                    tl.SetValorPB((100 / it12.GetQuantidadeEnsaios()) / GridFreqWifi.Rows.Count);
                                }
                                if (salva.EnsaiosItem12[1] == true)
                                {
                                    radical.Densidade_Espectral_de_Potencia(GridFreqWifi.Rows[i].Cells[0].Value.ToString(), TextBoxIP.Text, GridFreqWifi.Rows[i].Cells[1].Value.ToString(), GridFreqWifi.Rows[i].Cells[2].Value.ToString(), RefLevel, Att, ((bool?)GridFreqWifi.Rows[i].Cells[3].Value) ?? false, Marca, NomePasta);
                                    tl.SetValorPB((100 / it12.GetQuantidadeEnsaios()) / GridFreqWifi.Rows.Count);
                                }
                                if (salva.EnsaiosItem12[2] == true)
                                {
                                    for (int x = 0; x < 4; x++)
                                    {
                                        switch (x)
                                        {
                                            case 0:
                                                radical.Espurios(salva.FreqEspuriosWifi[0], salva.FreqEspuriosWifi[1], TextBoxIP.Text, GridFreqWifi.Rows[x].Cells[1].Value.ToString(), RefLevel, Att, ((bool?)GridFreqWifi.Rows[x].Cells[3].Value) ?? false, Marca, NomePasta);
                                                break;
                                            case 1:
                                                radical.Espurios(Convert.ToString(Convert.ToInt32(salva.FreqEspuriosWifi[1]) - 100), salva.FreqEspuriosWifi[1], TextBoxIP.Text, GridFreqWifi.Rows[x].Cells[1].Value.ToString(), RefLevel, Att, ((bool?)GridFreqWifi.Rows[x].Cells[3].Value) ?? false, Marca,  NomePasta);
                                                break;
                                            case 2:
                                                radical.Espurios(salva.FreqEspuriosWifi[2], Convert.ToString(100 + Convert.ToInt32(salva.FreqEspuriosWifi[2])), TextBoxIP.Text, GridFreqWifi.Rows[x].Cells[1].Value.ToString(), RefLevel, Att, ((bool?)GridFreqWifi.Rows[x].Cells[3].Value) ?? false, Marca,  NomePasta);
                                                break;
                                            case 3:
                                                radical.Espurios(salva.FreqEspuriosWifi[2], salva.FreqEspuriosWifi[3], TextBoxIP.Text, GridFreqWifi.Rows[x].Cells[1].Value.ToString(), RefLevel, Att, ((bool?)GridFreqWifi.Rows[x].Cells[3].Value) ?? false, Marca,  NomePasta);
                                                break;

                                        }
                                    }
                                    tl.SetValorPB((100 / it12.GetQuantidadeEnsaios()) / GridFreqWifi.Rows.Count);
                                }
                            }
                            tl.Close();
                            TocaRatinho();
                            CriaInfoMetrologista();
                        }
                        else
                        {
                            MessageBox.Show("Insira um caminho válido");
                        }
                            
                    }
                    else
                    {
                        if (GridFreqWifi.Rows.Count == 0 && GridFreqBt.Rows.Count != 0)
                        {
                            if (CriaPasta())
                            {
                                tl.Show();
                                for (int i = 0; i < GridFreqBt.Rows.Count; i++)
                                {
                                    MessageBox.Show($"Iniciando o Ensaio do {GridFreqBt.Rows[i].Cells[0].Value} - {GridFreqBt.Rows[i].Cells[1].Value}, configure o aparelho");
                                    if (salva.EnsaiosItem10[0] == true)
                                    {
                                        radical.Largura_20dB(GridFreqBt.Rows[i].Cells[0].Value.ToString(), TextBoxIP.Text, GridFreqBt.Rows[i].Cells[1].Value.ToString(), GridFreqBt.Rows[i].Cells[2].Value.ToString(), CarregaRefLevel(), CarregaAtt(), ((bool?)GridFreqBt.Rows[i].Cells[3].Value) ?? false, CarregaMarca(), NomePasta);
                                        tl.SetValorPB((100 / it10.GetQuantidadeEnsaios()) / GridFreqBt.Rows.Count);
                                    }
                                    if (salva.EnsaiosItem10[1] == true)
                                    {
                                        radical.Potência_de_pico_máxima(GridFreqBt.Rows[i].Cells[0].Value.ToString(), TextBoxIP.Text, GridFreqBt.Rows[i].Cells[1].Value.ToString(), GridFreqBt.Rows[i].Cells[2].Value.ToString(), RefLevel, Att, ((bool?)GridFreqBt.Rows[i].Cells[3].Value) ?? false, Marca, NomePasta);
                                        tl.SetValorPB((100 / it10.GetQuantidadeEnsaios()) / GridFreqBt.Rows.Count);
                                    }
                                    if (salva.EnsaiosItem10[2] == true)
                                    {
                                        for (int j = 0; j < 4; j++)
                                        {
                                            switch (j)
                                            {
                                                case 0:
                                                    MessageBox.Show("Selecione no aparelho a frequencia Inicial");
                                                    radical.Espurios(salva.FreqEspuriosBT[0], salva.FreqEspuriosBT[1], TextBoxIP.Text, GridFreqBt.Rows[j].Cells[1].Value.ToString(), RefLevel, Att, ((bool?)GridFreqBt.Rows[j].Cells[3].Value) ?? false, Marca, NomePasta);
                                                    break;
                                                case 1:
                                                    radical.Espurios(Convert.ToString(Convert.ToInt32(salva.FreqEspuriosBT[1]) - 100), salva.FreqEspuriosBT[1], TextBoxIP.Text, GridFreqBt.Rows[j].Cells[1].Value.ToString(), RefLevel, Att, ((bool?)GridFreqBt.Rows[j].Cells[3].Value) ?? false, Marca, NomePasta);
                                                    break;
                                                case 2:
                                                    MessageBox.Show("Selecione no aparelho a frequencia final");
                                                    radical.Espurios(salva.FreqEspuriosBT[2], Convert.ToString(100 + Convert.ToInt32(salva.FreqEspuriosBT[2])), TextBoxIP.Text, GridFreqBt.Rows[j].Cells[1].Value.ToString(), RefLevel, Att, ((bool?)GridFreqBt.Rows[j].Cells[3].Value) ?? false, Marca, NomePasta);
                                                    break;
                                                case 3:
                                                    radical.Espurios(salva.FreqEspuriosBT[2], salva.FreqEspuriosBT[3], TextBoxIP.Text, GridFreqBt.Rows[j].Cells[1].Value.ToString(), RefLevel, Att, ((bool?)GridFreqBt.Rows[j].Cells[3].Value) ?? false, Marca, NomePasta);
                                                    MessageBox.Show("Terminando ensaio de Espurios, volte pra frequencia de ensaio");
                                                    break;
                                            }
                                        }
                                        tl.SetValorPB((100 / it10.GetQuantidadeEnsaios()) / GridFreqBt.Rows.Count);
                                    }
                                    if (salva.EnsaiosItem10[3] == true)
                                    {
                                        MessageBox.Show("Iniciando ensaio de separação de canais de salto, coloque o dispositivo em modo de salto");
                                        if (!radical.Separação_Entre_Canais_de_Salto(GridFreqBt.Rows[i].Cells[0].Value.ToString(), TextBoxIP.Text, GridFreqBt.Rows[i].Cells[2].Value.ToString(), RefLevel, Att, Marca))
                                        {
                                            MessageBox.Show("Tudo certo ai, chefia?");
                                            if (((bool?)GridFreqBt.Rows[i].Cells[3].Value) ?? false)
                                            {
                                                radical.TiraPrint(GridFreqBt.Rows[i].Cells[0].Value.ToString(), TextBoxIP.Text, GridFreqBt.Rows[i].Cells[1].Value.ToString(), ((bool?)GridFreqBt.Rows[i].Cells[3].Value) ?? false, Marca, NomePasta, "Separacao Canais de Salto");
                                            }
                                            radical.GetMarkers(GridFreqBt.Rows[i].Cells[0].Value.ToString(), GridFreqBt.Rows[i].Cells[1].Value.ToString(), Marca, TextBoxIP.Text, 3, NomePasta);
                                        }
                                        tl.SetValorPB((100 / it10.GetQuantidadeEnsaios()) / GridFreqBt.Rows.Count);
                                    }
                                    if (salva.EnsaiosItem10[4] == true)
                                    {
                                        MessageBox.Show("Iniciando Ensaio de numero de Canais de Salto, coloque o dispositivo em modo salto!");
                                        radical.Numero_De_Frequencia_de_Salto(salva.FreqNumeroCanaisDeSalto[0], salva.FreqNumeroCanaisDeSalto[1], TextBoxIP.Text, RefLevel, Att, Marca);
                                        MessageBox.Show("Tudo Certo ai, chefia?");
                                        if (((bool?)GridFreqBt.Rows[i].Cells[3].Value) ?? false)
                                        {
                                            radical.TiraPrint(salva.FreqNumeroCanaisDeSalto[0] + " " + salva.FreqNumeroCanaisDeSalto[1], TextBoxIP.Text, GridFreqBt.Rows[i].Cells[1].Value.ToString(), ((bool?)GridFreqBt.Rows[i].Cells[3].Value) ?? false, Marca, NomePasta, "numero de Canais de Salto");
                                        }
                                        radical.Numero_De_Frequencia_de_Salto(salva.FreqNumeroCanaisDeSalto[1], salva.FreqNumeroCanaisDeSalto[2], TextBoxIP.Text, RefLevel, Att, Marca);
                                        MessageBox.Show("Tudo Certo ai, chefia?");
                                        if (((bool?)GridFreqBt.Rows[i].Cells[3].Value) ?? false)
                                        {
                                            radical.TiraPrint(salva.FreqNumeroCanaisDeSalto[1] + " " + salva.FreqNumeroCanaisDeSalto[2], TextBoxIP.Text, GridFreqBt.Rows[i].Cells[1].Value.ToString(), ((bool?)GridFreqBt.Rows[i].Cells[3].Value) ?? false, Marca, NomePasta, "numero de Canais de Salto");
                                        }
                                        tl.SetValorPB((100 / it10.GetQuantidadeEnsaios()) / GridFreqBt.Rows.Count);
                                    }
                                    if (salva.EnsaiosItem10[5] == true)
                                    {
                                        MessageBox.Show("Iniciando ensaio de numero de ocupações, coloque o dispositivo em modo de salto");
                                        Ensaio_Numero_de_Ocupações(GridFreqBt.Rows[i].Cells[0].Value.ToString(), TextBoxIP.Text, GridFreqBt.Rows[i].Cells[1].Value.ToString(), ((bool?)GridFreqBt.Rows[i].Cells[3].Value) ?? false);
                                        tl.SetValorPB((100 / it10.GetQuantidadeEnsaios()) / GridFreqBt.Rows.Count);

                                    }
                                    if (salva.EnsaiosItem10[6] == true)
                                    {
                                        MessageBox.Show("Iniciando ensaio de Tempo de Ocupação, coloque o dispositivo em modo de salto");
                                        Ensaio_Tempo_de_Ocupação(GridFreqBt.Rows[i].Cells[0].Value.ToString(), TextBoxIP.Text, GridFreqBt.Rows[i].Cells[1].Value.ToString(), ((bool?)GridFreqBt.Rows[i].Cells[3].Value) ?? false);
                                        tl.SetValorPB((100 / it10.GetQuantidadeEnsaios()) / GridFreqBt.Rows.Count);
                                    }                                   
                                }
                                tl.Close();
                                TocaRatinho();
                                CriaInfoMetrologista();
                            }
                            else
                            {
                                MessageBox.Show("Insira um caminho válido");
                            }
                        }
                        else
                        {
                            MessageBox.Show("Selecione Tecnologia de Apenas um Tipo");
                        }
                    }
                }
                else
                {
                    MessageBox.Show("Máquina não conectada");
                }
            }
            else
            {
                MessageBox.Show("Selecione alguma frequência");
            }


        }

        private void CriaInfoMetrologista()
        {
            if (!Directory.Exists(NomePasta))
            {
                Directory.CreateDirectory(NomePasta);
                var _ = NomePasta + @"\InfoMetrologista.csv";
                var fs = File.Create(_);
                fs.Close();
                File.AppendAllText(_, NomeEnsaio + ",");
                File.AppendAllText(_, NomeMetrologista + ";");
                File.AppendAllText(_, DateTime.Now.ToString("g") + ";");
            }
            else
            {
                var _ = NomePasta + @"\InfoMetrologista.csv";
                var fs = File.Create(_);
                fs.Close();
                File.AppendAllText(_, NomeEnsaio + ",");
                File.AppendAllText(_, NomeMetrologista + ";");
                File.AppendAllText(_, DateTime.Now.ToString("g") + ";");
            }
        }

        private static void TocaRatinho()
        {
            //SoundPlayer simpleSound = new SoundPlayer(@"C:\Users\80400197\Documents\GitHub\Automacao-N9010A\Automacao N9010A\Ratinho.wav");
            //simpleSound.Play();
        }

        private void BtItem10_Click(object sender, EventArgs e)
        {
            it10 = new Item_10();
            if (Application.OpenForms["Item_10"] == null)
            {
                it10.Show();
            }
            else
            {
                MessageBox.Show("Aba já está aberta");
            }
        }

        private void BtItem11_Click(object sender, EventArgs e)
        {
            it11 = new Item_11();
            if (Application.OpenForms["Item_11"] == null)
            {
                it11.Show();
            }
            else
            {
                MessageBox.Show("Aba já está aberta");
            }
        }

        private void BtItem12_Click(object sender, EventArgs e)
        {
            it12 = new Item_12();
            if (Application.OpenForms["Item_12"] == null)
            {
                it12.Show();
            }
            else
            {
                MessageBox.Show("Aba já está aberta");
            }

        }

        private void BtConfig_Click(object sender, EventArgs e)
        {
            config = new Configurações();
            if (Application.OpenForms["Configurações"] == null)
            {
                config.Show();
            }
            else
            {

                MessageBox.Show("Aba já está aberta");
            }
        }

        private void BtConectado_Click(object sender, EventArgs e)
        {
            radical = new AutomacaoN9010A();
            if (LConecta.Text == "CONECTADO")
            {
                MessageBox.Show("Aparelho já conectado");
            }
            else
            {

                if (radical.ConectaIP(TextBoxIP.Text) == true)
                {
                    LConecta.Text = "CONECTADO";
                    LConecta.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    MessageBox.Show("Erro ao se conectar com o aparelho");
                    LConecta.Text = "SEM CONEXÃO";
                    LConecta.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        private void CBSelTipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            SalvaTipo();
            if (CBSelTipo.SelectedItem.Equals("Wifi"))
            {
                GridFreqWifi.Visible = true;
                GridFreqBt.Visible = false;
            }
            else
            {
                GridFreqWifi.Visible = false;
                GridFreqBt.Visible = true;
            }
        }

        private void Button1_Click(object sender, EventArgs e)
        {
            CommonOpenFileDialog dialog = new()
            {
                InitialDirectory = "C:\\Users",
                IsFolderPicker = true
            };
            if (dialog.ShowDialog() == CommonFileDialogResult.Ok)
            {
                NomePasta = dialog.FileName;
                LCaminhoPasta.Text = dialog.FileName;
            }
        }

        private void TbNomeEnsaio_TextChanged(object sender, EventArgs e)
        {
            NomeEnsaio = TbNomeEnsaio.Text;
        }

        private void TbNomeMetrologista_TextChanged(object sender, EventArgs e)
        {
            NomeMetrologista = TbNomeMetrologista.Text;
        }

        private void BtAddFreq_Click(object sender, EventArgs e)
        {
            if (CBSelTipo.SelectedItem.Equals("Wifi"))
            {
                ;
                GridFreqWifi.Rows.Add() ;
                GridFreqWifi.Rows[0].Cells[3].Value = false;
            }
            else
            {
                GridFreqBt.Rows.Add();
                GridFreqBt.Rows[0].Cells[3].Value = false;
            }
        }
    }
    public class Save
    {
        public bool[] EnsaiosItem10 { get; set; }
        public bool[] EnsaiosItem11 { get; set; }
        public bool[] EnsaiosItem12 { get; set; }
        public string RefLevel { get; set; }
        public string Att { get; set; }
        public string Marca { get; set; }
        public bool AtivarPrints { get; set; }
        public int SelTipo { get; set; }
        public string[] FreqEspuriosWifi { get; set; }
        public string[] FreqEspuriosBT { get; set; }
        public string[] FreqNumeroCanaisDeSalto { get; set; }
    }
}
