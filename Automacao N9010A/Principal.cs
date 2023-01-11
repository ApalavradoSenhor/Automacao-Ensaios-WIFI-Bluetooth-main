using MatheusProductions.AutomacaoN9010A;
using System;
using System.Windows.Forms;
using MatheusProductions.KeysightLib;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.IO;
using System.Media;


namespace Automacao_N9010A
{


    public partial class Principal : Form
    {
        string RefLevel;
        string Att;
        string marca;
        string configFreqWifi;
        string configFreqBt;
        string caminhoJson = System.AppDomain.CurrentDomain.BaseDirectory.ToString();
        Keysight ks;
        string jsonString;
        FileStream json;
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
            ks = new Keysight();
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
                    ListaTecnologiasBT.Visible = false;
                    ListaTecnologiasWifi.Visible = true;
                }
                else
                {
                    ListaTecnologiasBT.Visible = true;
                    ListaTecnologiasWifi.Visible = false;
                }
            }
        }

        #region Carrega/Salva
        public string CarregaConfigFreqWifi()
        {
            jsonString = File.ReadAllText(caminhoJson);
            salva = JsonSerializer.Deserialize<Save>(jsonString);

            return salva.FreqEspuriosWifi[1];
        }

        public string CarregaConfigFreqBt()
        {
            jsonString = File.ReadAllText(caminhoJson);
            salva = JsonSerializer.Deserialize<Save>(jsonString);

            return salva.FreqEspuriosBT[1];
        }


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

        public void Ensaio_Largura_de_faixa_a_6_dB(string valFreq, string ip, string ensaioAtual, Configurações config)
        {
            radical = new AutomacaoN9010A();
            Att = CarregaAtt();
            RefLevel = CarregaRefLevel();
            marca = CarregaMarca();
            if (marca != "NA")
            {
                if (ensaioAtual == "Bluetooth Low Energy")
                {
                    radical.Largura_6dB(valFreq, ip, ensaioAtual, "2", RefLevel, Att, config.GetTPrints(), marca);
                    return;
                }
                if (ensaioAtual == "802.11a" || ensaioAtual == "802.11b" || ensaioAtual == "802.11g" || ensaioAtual == "802.11n (20)" || ensaioAtual == "802.11ac (20)" || ensaioAtual == "802.11ax (20)")
                {
                    radical.Largura_6dB(valFreq, ip, ensaioAtual, "20", RefLevel, Att, config.GetTPrints(), marca);
                    return;
                }
                if (ensaioAtual == "802.11n (40)" || ensaioAtual == "802.11ac (40)" || ensaioAtual == "802.11ax (40)")
                {
                    radical.Largura_6dB(valFreq, ip, ensaioAtual, "40", RefLevel, Att, config.GetTPrints(), marca);
                    return;
                }
                if (ensaioAtual == "802.11n (80)" || ensaioAtual == "802.11ac (80)" || ensaioAtual == "802.11ax (80)")
                {
                    radical.Largura_6dB(valFreq, ip, ensaioAtual, "80", RefLevel, Att, config.GetTPrints(), marca);
                    return;
                }
                if (ensaioAtual == "802.11ax (160)")
                {
                    radical.Largura_6dB(valFreq, ip, ensaioAtual, "160", RefLevel, Att, config.GetTPrints(), marca);
                    return;
                }
            }

        }

        public void Ensaio_Largura_de_faixa_a_26_dB(string valFreq, string ip, string ensaioAtual, Configurações config)
        {
            radical = new AutomacaoN9010A();
            Att = CarregaAtt();
            RefLevel = CarregaRefLevel();
            marca = CarregaMarca();
            if (marca != "NA")
            {
                if (marca != "NA")
                {
                    if (ensaioAtual == "Bluetooth Low Energy")
                    {
                        radical.Largura_26dB(valFreq, ip, ensaioAtual, "2", RefLevel, Att, config.GetTPrints(), marca);
                        return;
                    }
                    if (ensaioAtual == "802.11a" || ensaioAtual == "802.11b" || ensaioAtual == "802.11g" || ensaioAtual == "802.11n (20)" || ensaioAtual == "802.11ac (20)" || ensaioAtual == "802.11ax (20)")
                    {
                        radical.Largura_26dB(valFreq, ip, ensaioAtual, "20", RefLevel, Att, config.GetTPrints(), marca);
                        return;
                    }
                    if (ensaioAtual == "802.11n (40)" || ensaioAtual == "802.11ac (40)" || ensaioAtual == "802.11ax (40)")
                    {
                        radical.Largura_26dB(valFreq, ip, ensaioAtual, "40", RefLevel, Att, config.GetTPrints(), marca);
                        return;
                    }
                    if (ensaioAtual == "802.11n (80)" || ensaioAtual == "802.11ac (80)" || ensaioAtual == "802.11ax (80)")
                    {
                        radical.Largura_26dB(valFreq, ip, ensaioAtual, "80", RefLevel, Att, config.GetTPrints(), marca);
                        return;
                    }
                    if (ensaioAtual == "802.11ax (160)")
                    {
                        radical.Largura_26dB(valFreq, ip, ensaioAtual, "160", RefLevel, Att, config.GetTPrints(), marca);
                        return;
                    }
                }
            }
        }

        public void Ensaio_pico_da_densidade_de_potência(string valFreq, string ip, string ensaioAtual, Configurações config)
        {
            radical = new AutomacaoN9010A();
            Att = CarregaAtt();
            RefLevel = CarregaRefLevel();
            marca = CarregaMarca();

            if (marca != "NA")
            {
                if (ensaioAtual == "Bluetooth Low Energy")
                {
                    radical.Pico_da_densidade_de_potência(valFreq, ip, ensaioAtual, "2", RefLevel, Att, config.GetTPrints(), marca);
                    return;
                }
                if (ensaioAtual == "802.11a" || ensaioAtual == "802.11b" || ensaioAtual == "802.11g" || ensaioAtual == "802.11n (20)" || ensaioAtual == "802.11ac (20)" || ensaioAtual == "802.11ax (20)")
                {
                    radical.Pico_da_densidade_de_potência(valFreq, ip, ensaioAtual, "20", RefLevel, Att, config.GetTPrints(), marca);
                    return;
                }
                if (ensaioAtual == "802.11n (40)" || ensaioAtual == "802.11ac (40)" || ensaioAtual == "802.11ax (40)")
                {
                    radical.Pico_da_densidade_de_potência(valFreq, ip, ensaioAtual, "40", RefLevel, Att, config.GetTPrints(), marca);
                    return;
                }
                if (ensaioAtual == "802.11n (80)" || ensaioAtual == "802.11ac (80)" || ensaioAtual == "802.11ax (80)")
                {
                    radical.Pico_da_densidade_de_potência(valFreq, ip, ensaioAtual, "80", RefLevel, Att, config.GetTPrints(), marca);
                    return;
                }
                if (ensaioAtual == "802.11ax (160)")
                {
                    radical.Pico_da_densidade_de_potência(valFreq, ip, ensaioAtual, "160", RefLevel, Att, config.GetTPrints(), marca);
                    return;
                }
            }
        }

        public void Ensaio_Valor_Medio_Densidade_Espectral(string valFreq, string ip, string ensaioAtual, Configurações config)
        {
            radical = new AutomacaoN9010A();
            Att = CarregaAtt();
            RefLevel = CarregaRefLevel();
            marca = CarregaMarca();
            if (marca != "NA")
            {
                if (ensaioAtual == "Bluetooth Low Energy")
                {
                    radical.Valor_médio_da_densidade_espectral_de_potência(valFreq, ip, ensaioAtual, "2", RefLevel, Att, config.GetTPrints(), marca);
                    return;
                }
                if (ensaioAtual == "802.11a" || ensaioAtual == "802.11b" || ensaioAtual == "802.11g" || ensaioAtual == "802.11n (20)" || ensaioAtual == "802.11ac (20)" || ensaioAtual == "802.11ax (20)")
                {
                    radical.Valor_médio_da_densidade_espectral_de_potência(valFreq, ip, ensaioAtual, "20", RefLevel, Att, config.GetTPrints(), marca);
                    return;
                }
                if (ensaioAtual == "802.11n (40)" || ensaioAtual == "802.11ac (40)" || ensaioAtual == "802.11ax (40)")
                {
                    radical.Valor_médio_da_densidade_espectral_de_potência(valFreq, ip, ensaioAtual, "40", RefLevel, Att, config.GetTPrints(), marca);
                    return;
                }
                if (ensaioAtual == "802.11n (80)" || ensaioAtual == "802.11ac (80)" || ensaioAtual == "802.11ax (80)")
                {
                    radical.Valor_médio_da_densidade_espectral_de_potência(valFreq, ip, ensaioAtual, "80", RefLevel, Att, config.GetTPrints(), marca);
                    return;
                }
                if (ensaioAtual == "802.11ax (160)")
                {
                    radical.Valor_médio_da_densidade_espectral_de_potência(valFreq, ip, ensaioAtual, "160", RefLevel, Att, config.GetTPrints(), marca);
                    return;
                }
            }

        }

        public void Ensaio_Potencia_de_Pico_Maxima(string valFreq, string ip, string ensaioAtual, Configurações config)
        {
            radical = new AutomacaoN9010A();
            Att = CarregaAtt();
            RefLevel = CarregaRefLevel();
            marca = CarregaMarca();

            if (marca != "NA")
            {
                if (ensaioAtual == "Bluetooth Low Energy")
                {
                    radical.Potência_de_pico_máxima(valFreq, ip, ensaioAtual, "2", RefLevel, Att, config.GetTPrints(), marca);
                    return;
                }
                if (ensaioAtual == "802.11a" || ensaioAtual == "802.11b" || ensaioAtual == "802.11g" || ensaioAtual == "802.11n (20)" || ensaioAtual == "802.11ac (20)" || ensaioAtual == "802.11ax (20)")
                {
                    radical.Potência_de_pico_máxima(valFreq, ip, ensaioAtual, "20", RefLevel, Att, config.GetTPrints(), marca);
                    return;
                }
                if (ensaioAtual == "802.11n (40)" || ensaioAtual == "802.11ac (40)" || ensaioAtual == "802.11ax (40)")
                {
                    radical.Potência_de_pico_máxima(valFreq, ip, ensaioAtual, "40", RefLevel, Att, config.GetTPrints(), marca);
                    return;
                }
                if (ensaioAtual == "802.11n (80)" || ensaioAtual == "802.11ac (80)" || ensaioAtual == "802.11ax (80)")
                {
                    radical.Potência_de_pico_máxima(valFreq, ip, ensaioAtual, "80", RefLevel, Att, config.GetTPrints(), marca);
                    return;
                }
                if (ensaioAtual == "802.11ax (160)")
                {
                    radical.Potência_de_pico_máxima(valFreq, ip, ensaioAtual, "160", RefLevel, Att, config.GetTPrints(), marca);
                    return;
                }
            }
        }

        public void Ensaio_Valor_médio_da_potência_máxima_de_saída(string valFreq, string ip, string ensaioAtual, Configurações config)
        {
            radical = new AutomacaoN9010A();
            Att = CarregaAtt();
            RefLevel = CarregaRefLevel();
            marca = CarregaMarca();

            if (marca != "NA")
            {
                if (ensaioAtual == "Bluetooth Low Energy")
                {
                    radical.Valor_médio_da_potência_máxima_de_saída(valFreq, ip, ensaioAtual, "2", RefLevel, Att, config.GetTPrints(), marca);
                    return;
                }
                if (ensaioAtual == "802.11a" || ensaioAtual == "802.11b" || ensaioAtual == "802.11g" || ensaioAtual == "802.11n (20)" || ensaioAtual == "802.11ac (20)" || ensaioAtual == "802.11ax (20)")
                {
                    radical.Valor_médio_da_potência_máxima_de_saída(valFreq, ip, ensaioAtual, "20", RefLevel, Att, config.GetTPrints(), marca);
                    return;
                }
                if (ensaioAtual == "802.11n (40)" || ensaioAtual == "802.11ac (40)" || ensaioAtual == "802.11ax (40)")
                {
                    radical.Valor_médio_da_potência_máxima_de_saída(valFreq, ip, ensaioAtual, "40", RefLevel, Att, config.GetTPrints(), marca);
                    return;
                }
                if (ensaioAtual == "802.11n (80)" || ensaioAtual == "802.11ac (80)" || ensaioAtual == "802.11ax (80)")
                {
                    radical.Valor_médio_da_potência_máxima_de_saída(valFreq, ip, ensaioAtual, "80", RefLevel, Att, config.GetTPrints(), marca);
                    return;
                }
                if (ensaioAtual == "802.11ax (160)")
                {
                    radical.Valor_médio_da_potência_máxima_de_saída(valFreq, ip, ensaioAtual, "160", RefLevel, Att, config.GetTPrints(), marca);
                    return;
                }
            }

        }

        public void Ensaio_Espurios(string freqI, string freqF, string ip, string ensaioAtual, Configurações config)
        {
            radical = new AutomacaoN9010A();
            Att = CarregaAtt();
            RefLevel = CarregaRefLevel();
            marca = CarregaMarca();
            configFreqWifi = CarregaConfigFreqWifi();
            configFreqBt = CarregaConfigFreqBt();

            if (marca != "NA")
            {
                if (ensaioAtual == "Bluetooth Low Energy")
                {
                    radical.Espurios(freqI, freqF, ip, ensaioAtual, RefLevel, Att, config.GetTPrints(), marca, "2", configFreqWifi);
                    return;
                }
                if (ensaioAtual == "802.11a" || ensaioAtual == "802.11b" || ensaioAtual == "802.11g" || ensaioAtual == "802.11n (20)" || ensaioAtual == "802.11ac (20)" || ensaioAtual == "802.11ax (20)")
                {
                    radical.Espurios(freqI, freqF, ip, ensaioAtual, RefLevel, Att, config.GetTPrints(), marca, "20", configFreqWifi);
                    return;
                }
                if (ensaioAtual == "802.11n (40)" || ensaioAtual == "802.11ac (40)" || ensaioAtual == "802.11ax (40)")
                {
                    radical.Espurios(freqI, freqF, ip, ensaioAtual, RefLevel, Att, config.GetTPrints(), marca, "40", configFreqWifi);
                    return;
                }
                if (ensaioAtual == "802.11n (80)" || ensaioAtual == "802.11ac (80)" || ensaioAtual == "802.11ax (80)")
                {
                    radical.Espurios(freqI, freqF, ip, ensaioAtual, RefLevel, Att, config.GetTPrints(), marca, "80", configFreqWifi);
                    return;
                }
                if (ensaioAtual == "802.11ax (160)")
                {
                    radical.Espurios(freqI, freqF, ip, ensaioAtual, RefLevel, Att, config.GetTPrints(), marca, "160", configFreqWifi);
                    return;
                }
                if (ensaioAtual == "GFSK" || ensaioAtual == "PI4 DQPSK" || ensaioAtual == "8DPSK")
                {
                    radical.Espurios(freqI, freqF, ip, ensaioAtual, RefLevel, Att, config.GetTPrints(), marca, "2", configFreqBt);
                    return;
                }
            }
            else
            {
                MessageBox.Show("Selecione um Modelo");
            }

        }


        public void Ensaio_Tempo_de_Ocupação(string valFreq, string ip, string ensaioAtual, Configurações config)
        {
            radical = new AutomacaoN9010A();
            Att = CarregaAtt();
            RefLevel = CarregaRefLevel();
            marca = config.GetMarca();
            string nomePasta = @"\\A-N9010A-00151\prints\Tempo de Ocupacao";
            if (marca != "NA")
            {
                switch (ensaioAtual)
                {
                    case "GFSK":
                        if (radical.TempoDeOcupacao(valFreq, ip, ensaioAtual, "2", RefLevel, Att, config.GetTPrints(), marca))
                        {
                            DialogResult dialogResult = DialogResult.No;
                            while (dialogResult == DialogResult.No)
                            {
                                radical.TempoDeOcupacao(valFreq, ip, ensaioAtual, "2", RefLevel, Att, config.GetTPrints(), marca);
                                dialogResult = MessageBox.Show("Tudo certo ai, chefia?", "Aviso", MessageBoxButtons.YesNo);
                            }
                            if (config.GetTPrints())
                            {
                                radical.TiraPrint(valFreq, ip, ensaioAtual, config.GetTPrints(), marca, nomePasta);
                            }
                            radical.GetMarkersTempo(valFreq, ensaioAtual, marca, ip, nomePasta);
                        }
                        break;
                    case "PI4 DQPSK":
                        if (radical.TempoDeOcupacao(valFreq, ip, ensaioAtual, "2", RefLevel, Att, config.GetTPrints(), marca))
                        {
                            DialogResult dialogResult = DialogResult.No;
                            while (dialogResult == DialogResult.No)
                            {
                                radical.TempoDeOcupacao(valFreq, ip, ensaioAtual, "2", RefLevel, Att, config.GetTPrints(), marca);
                                dialogResult = MessageBox.Show("Tudo certo ai, chefia?", "Aviso", MessageBoxButtons.YesNo);
                            }
                            if (config.GetTPrints())
                            {
                                radical.TiraPrint(valFreq, ip, ensaioAtual, config.GetTPrints(), marca, nomePasta);
                            }
                            radical.GetMarkersTempo(valFreq, ensaioAtual, marca, ip, nomePasta);
                        }
                        break;
                    case "8DPSK":
                        if (radical.TempoDeOcupacao(valFreq, ip, ensaioAtual, "2", RefLevel, Att, config.GetTPrints(), marca))
                        {
                            DialogResult dialogResult = DialogResult.No;
                            while (dialogResult == DialogResult.No)
                            {
                                radical.TempoDeOcupacao(valFreq, ip, ensaioAtual, "2", RefLevel, Att, config.GetTPrints(), marca);
                                dialogResult = MessageBox.Show("Tudo certo ai, chefia?", "Aviso", MessageBoxButtons.YesNo);
                            }
                            if (config.GetTPrints())
                            {
                                radical.TiraPrint(valFreq, ip, ensaioAtual, config.GetTPrints(), marca, nomePasta);
                            }
                            radical.GetMarkersTempo(valFreq, ensaioAtual, marca, ip, nomePasta);
                        }
                        break;
                }
            }
        }


        public void Ensaio_Numero_de_Canais(string freqI, string freqF, string freqM, string ip, string ensaioAtual, Configurações config)
        {
            radical = new AutomacaoN9010A();
            Att = CarregaAtt();
            RefLevel = CarregaRefLevel();
            marca = config.GetMarca();
            string nomePasta = @"\\A-N9010A-00151\prints\Numero de Canais";
            if (marca != "NA")
            {
                switch (ensaioAtual)
                {
                    case "GFSK":
                        radical.Numero_De_Frequencia_de_Salto(freqI, freqM, ip, ensaioAtual, "2", RefLevel, Att, config.GetTPrints(), marca);
                        MessageBox.Show("Tudo Certo ai, chefia?");
                        if (config.GetTPrints())
                        {
                            radical.TiraPrint(freqI + " " + freqM, ip, ensaioAtual, config.GetTPrints(), marca, nomePasta);
                        }
                        radical.Numero_De_Frequencia_de_Salto(freqM, freqF, ip, ensaioAtual, "2", RefLevel, Att, config.GetTPrints(), marca);
                        MessageBox.Show("Tudo Certo ai, chefia?");
                        if (config.GetTPrints())
                        {
                            radical.TiraPrint(freqM + " " + freqF, ip, ensaioAtual, config.GetTPrints(), marca, nomePasta);
                        }
                        break;
                    case "PI4 DQPSK":
                        radical.Numero_De_Frequencia_de_Salto(freqI, freqM, ip, ensaioAtual, "2", RefLevel, Att, config.GetTPrints(), marca);
                        MessageBox.Show("Tudo Certo ai, chefia?");
                        if (config.GetTPrints())
                        {
                            radical.TiraPrint(freqI + " " + freqM, ip, ensaioAtual, config.GetTPrints(), marca, nomePasta);
                        }
                        radical.Numero_De_Frequencia_de_Salto(freqM, freqF, ip, ensaioAtual, "2", RefLevel, Att, config.GetTPrints(), marca);
                        MessageBox.Show("Tudo Certo ai, chefia?");
                        if (config.GetTPrints())
                        {
                            radical.TiraPrint(freqM + " " + freqF, ip, ensaioAtual, config.GetTPrints(), marca, nomePasta);
                        }
                        break;
                    case "8DPSK":
                        radical.Numero_De_Frequencia_de_Salto(freqI, freqM, ip, ensaioAtual, "2", RefLevel, Att, config.GetTPrints(), marca);
                        MessageBox.Show("Tudo Certo ai, chefia?");
                        if (config.GetTPrints())
                        {
                            radical.TiraPrint(freqI + " " + freqM, ip, ensaioAtual, config.GetTPrints(), marca, nomePasta);
                        }
                        radical.Numero_De_Frequencia_de_Salto(freqM, freqF, ip, ensaioAtual, "2", RefLevel, Att, config.GetTPrints(), marca);
                        MessageBox.Show("Tudo Certo ai, chefia?");
                        if (config.GetTPrints())
                        {
                            radical.TiraPrint(freqM + " " + freqF, ip, ensaioAtual, config.GetTPrints(), marca, nomePasta);
                        }
                        break;
                }
            }
        }

        public void Ensaio_Numero_de_Ocupações(string valFreq, string ip, string ensaioAtual, Configurações config)
        {
            radical = new AutomacaoN9010A();
            Att = CarregaAtt();
            RefLevel = CarregaRefLevel();
            marca = config.GetMarca();
            string nomePasta = @"\\A-N9010A-00151\prints\Numero de Ocupaçoes";
            int numMarkers = 0;
            if (marca != "NA")
            {
                switch (ensaioAtual)
                {
                    case "GFSK":
                        if (radical.NumeroDeOcupacoes(valFreq, ip, ensaioAtual, "2", RefLevel, Att, config.GetTPrints(), marca, ref numMarkers))
                        {
                            DialogResult dialogResult = DialogResult.No;
                            while (dialogResult == DialogResult.No)
                            {
                                radical.NumeroDeOcupacoes(valFreq, ip, ensaioAtual, "2", RefLevel, Att, config.GetTPrints(), marca, ref numMarkers);
                                dialogResult = MessageBox.Show("Tudo certo ai, chefia?", "Aviso", MessageBoxButtons.YesNo);
                            }
                            if (config.GetTPrints())
                            {
                                radical.TiraPrint(valFreq, ip, ensaioAtual, config.GetTPrints(), marca, nomePasta);
                            }
                            radical.GetMarkersNmrOcu(valFreq, ensaioAtual, marca, ip, numMarkers, nomePasta);
                        }
                        break;
                    case "PI4 DQPSK":
                        if (radical.NumeroDeOcupacoes(valFreq, ip, ensaioAtual, "2", RefLevel, Att, config.GetTPrints(), marca, ref numMarkers))
                        {
                            DialogResult dialogResult = DialogResult.No;
                            while (dialogResult == DialogResult.No)
                            {
                                radical.NumeroDeOcupacoes(valFreq, ip, ensaioAtual, "2", RefLevel, Att, config.GetTPrints(), marca, ref numMarkers);
                                dialogResult = MessageBox.Show("Tudo certo ai, chefia?", "Aviso", MessageBoxButtons.YesNo);
                            }
                            if (config.GetTPrints())
                            {
                                radical.TiraPrint(valFreq, ip, ensaioAtual, config.GetTPrints(), marca, nomePasta);
                            }
                            radical.GetMarkersNmrOcu(valFreq, ensaioAtual, marca, ip, numMarkers, nomePasta);
                        }
                        break;
                    case "8DPSK":
                        if (radical.NumeroDeOcupacoes(valFreq, ip, ensaioAtual, "2", RefLevel, Att, config.GetTPrints(), marca, ref numMarkers))
                        {
                            DialogResult dialogResult = DialogResult.No;
                            while (dialogResult == DialogResult.No)
                            {
                                radical.NumeroDeOcupacoes(valFreq, ip, ensaioAtual, "2", RefLevel, Att, config.GetTPrints(), marca, ref numMarkers);
                                dialogResult = MessageBox.Show("Tudo certo ai, chefia?", "Aviso", MessageBoxButtons.YesNo);
                            }
                            if (config.GetTPrints())
                            {
                                radical.TiraPrint(valFreq, ip, ensaioAtual, config.GetTPrints(), marca, nomePasta);
                            }
                            radical.GetMarkersNmrOcu(valFreq, ensaioAtual, marca, ip, numMarkers, nomePasta);
                        }
                        break;
                }
            }
        }

        public void Ensaio_Potencia_de_Saida(string valFreq, string ip, string ensaioAtual, Configurações config)
        {
            radical = new AutomacaoN9010A();
            Att = CarregaAtt();
            RefLevel = CarregaRefLevel();
            marca = config.GetMarca();

            if (marca != "NA")
            {
                switch (ensaioAtual)
                {
                    case "Bluetooth Low Energy":
                        radical.Potencia_De_Saida(valFreq, ip, ensaioAtual, "2", RefLevel, Att, config.GetTPrints(), marca);
                        break;
                    case "802.11a":
                        radical.Potencia_De_Saida(valFreq, ip, ensaioAtual, "20", RefLevel, Att, config.GetTPrints(), marca);
                        break;
                    case "802.11b":
                        radical.Potencia_De_Saida(valFreq, ip, ensaioAtual, "20", RefLevel, Att, config.GetTPrints(), marca);
                        break;
                    case "802.11g":
                        radical.Potencia_De_Saida(valFreq, ip, ensaioAtual, "20", RefLevel, Att, config.GetTPrints(), marca);
                        break;
                    case "802.11n (20)":
                        radical.Potencia_De_Saida(valFreq, ip, ensaioAtual, "20", RefLevel, Att, config.GetTPrints(), marca);
                        break;
                    case "802.11n (40)":
                        radical.Potencia_De_Saida(valFreq, ip, ensaioAtual, "40", RefLevel, Att, config.GetTPrints(), marca);
                        break;
                    case "802.11n (80)":
                        radical.Potencia_De_Saida(valFreq, ip, ensaioAtual, "80", RefLevel, Att, config.GetTPrints(), marca);
                        break;
                    case "802.11ac (20)":
                        radical.Potencia_De_Saida(valFreq, ip, ensaioAtual, "20", RefLevel, Att, config.GetTPrints(), marca);
                        break;
                    case "802.11ac (40)":
                        radical.Potencia_De_Saida(valFreq, ip, ensaioAtual, "40", RefLevel, Att, config.GetTPrints(), marca);
                        break;
                    case "802.11ac (80)":
                        radical.Potencia_De_Saida(valFreq, ip, ensaioAtual, "80", RefLevel, Att, config.GetTPrints(), marca);
                        break;
                    case "802.11ax (20)":
                        radical.Potencia_De_Saida(valFreq, ip, ensaioAtual, "20", RefLevel, Att, config.GetTPrints(), marca);
                        break;
                    case "802.11ax (40)":
                        radical.Potencia_De_Saida(valFreq, ip, ensaioAtual, "40", RefLevel, Att, config.GetTPrints(), marca);
                        break;
                    case "802.11ax (80)":
                        radical.Potencia_De_Saida(valFreq, ip, ensaioAtual, "80", RefLevel, Att, config.GetTPrints(), marca);
                        break;
                    case "802.11ax (160)":
                        radical.Potencia_De_Saida(valFreq, ip, ensaioAtual, "160", RefLevel, Att, config.GetTPrints(), marca);
                        break;
                }
            }

        }

        public void Ensaio_Densidade_Espectral_de_Potencia(string valFreq, string ip, string ensaioAtual, Configurações config)
        {
            radical = new AutomacaoN9010A();
            Att = CarregaAtt();
            RefLevel = config.GetRef();
            marca = config.GetMarca();

            if (marca != "NA")
            {
                switch (ensaioAtual)
                {
                    case "Bluetooth Low Energy":
                        radical.Densidade_Espectral_de_Potencia(valFreq, ip, ensaioAtual, "2", RefLevel, Att, config.GetTPrints(), marca);
                        break;
                    case "802.11a":
                        radical.Densidade_Espectral_de_Potencia(valFreq, ip, ensaioAtual, "20", RefLevel, Att, config.GetTPrints(), marca);
                        break;
                    case "802.11b":
                        radical.Densidade_Espectral_de_Potencia(valFreq, ip, ensaioAtual, "20", RefLevel, Att, config.GetTPrints(), marca);
                        break;
                    case "802.11g":
                        radical.Densidade_Espectral_de_Potencia(valFreq, ip, ensaioAtual, "20", RefLevel, Att, config.GetTPrints(), marca);
                        break;
                    case "802.11n (20)":
                        radical.Densidade_Espectral_de_Potencia(valFreq, ip, ensaioAtual, "20", RefLevel, Att, config.GetTPrints(), marca);
                        break;
                    case "802.11n (40)":
                        radical.Densidade_Espectral_de_Potencia(valFreq, ip, ensaioAtual, "40", RefLevel, Att, config.GetTPrints(), marca);
                        break;
                    case "802.11n (80)":
                        radical.Densidade_Espectral_de_Potencia(valFreq, ip, ensaioAtual, "80", RefLevel, Att, config.GetTPrints(), marca);
                        break;
                    case "802.11ac (20)":
                        radical.Densidade_Espectral_de_Potencia(valFreq, ip, ensaioAtual, "20", RefLevel, Att, config.GetTPrints(), marca);
                        break;
                    case "802.11ac (40)":
                        radical.Densidade_Espectral_de_Potencia(valFreq, ip, ensaioAtual, "40", RefLevel, Att, config.GetTPrints(), marca);
                        break;
                    case "802.11ac (80)":
                        radical.Densidade_Espectral_de_Potencia(valFreq, ip, ensaioAtual, "80", RefLevel, Att, config.GetTPrints(), marca);
                        break;
                    case "802.11ax (20)":
                        radical.Densidade_Espectral_de_Potencia(valFreq, ip, ensaioAtual, "20", RefLevel, Att, config.GetTPrints(), marca);
                        break;
                    case "802.11ax (40)":
                        radical.Densidade_Espectral_de_Potencia(valFreq, ip, ensaioAtual, "40", RefLevel, Att, config.GetTPrints(), marca);
                        break;
                    case "802.11ax (80)":
                        radical.Densidade_Espectral_de_Potencia(valFreq, ip, ensaioAtual, "80", RefLevel, Att, config.GetTPrints(), marca);
                        break;
                    case "802.11ax (160)":
                        radical.Densidade_Espectral_de_Potencia(valFreq, ip, ensaioAtual, "160", RefLevel, Att, config.GetTPrints(), marca);
                        break;
                }
            }

        }

        public void Ensaio_Separação_de_Canais_de_Salto(string valFreq, string ip, string ensaioAtual, Configurações config)
        {
            radical = new AutomacaoN9010A();
            Att = CarregaAtt();
            RefLevel = config.GetRef();
            marca = config.GetMarca();
            string nomePasta = @"\\A-N9010A-00151\prints\Separacao de Canais de Salto";

            if (marca != "NA")
            {
                switch (ensaioAtual)
                {
                    case "GFSK":

                        if (!radical.Separação_Entre_Canais_de_Salto(valFreq, ip, ensaioAtual, "2", RefLevel, Att, config.GetTPrints(), 3, marca))
                        {
                            MessageBox.Show("Tudo certo ai, chefia?");
                            if (config.GetTPrints())
                            {
                                radical.TiraPrint(valFreq, ip, ensaioAtual, config.GetTPrints(), marca, nomePasta);
                            }
                            radical.GetMarkers(valFreq, ensaioAtual, marca, ip, 3, nomePasta);
                        }

                        break;
                    case "PI4 DQPSK":
                        if (!radical.Separação_Entre_Canais_de_Salto(valFreq, ip, ensaioAtual, "2", RefLevel, Att, config.GetTPrints(), 3, marca))
                        {
                            MessageBox.Show("Tudo certo ai, chefia?");
                            if (config.GetTPrints())
                            {
                                radical.TiraPrint(valFreq, ip, ensaioAtual, config.GetTPrints(), marca, nomePasta);
                            }
                            radical.GetMarkers(valFreq, ensaioAtual, marca, ip, 3, nomePasta);
                        }
                        break;
                    case "8DPSK":
                        if (!radical.Separação_Entre_Canais_de_Salto(valFreq, ip, ensaioAtual, "2", RefLevel, Att, config.GetTPrints(), 3, marca))
                        {
                            MessageBox.Show("Tudo certo ai, chefia?");
                            if (config.GetTPrints())
                            {
                                radical.TiraPrint(valFreq, ip, ensaioAtual, config.GetTPrints(), marca, nomePasta);
                            }
                            radical.GetMarkers(valFreq, ensaioAtual, marca, ip, 3, nomePasta);
                        }
                        break;
                }
            }

        }

        private void BtConfirmar_Click(object sender, EventArgs e)
        {
            tl = new TelaLoading();
            config = new Configurações();
            it11 = new Item_11();
            it12 = new Item_12();
            it10 = new Item_10();
            jsonString = File.ReadAllText(caminhoJson);
            salva = JsonSerializer.Deserialize<Save>(jsonString);
            if (ListaTecnologiasWifi.CheckedItems.Count != 0 || ListaTecnologiasBT.CheckedItems.Count != 0)
            {
                if (TextBoxFreqC.Text != "")
                {
                    if (LConecta.Text == "CONECTADO")
                    {
                        if (ListaTecnologiasWifi.CheckedItems.Count != 0 && ListaTecnologiasBT.CheckedItems.Count == 0)
                        {
                            tl.Show();
                            for (int i = 0; i < ListaTecnologiasWifi.CheckedItems.Count; i++)
                            {
                                MessageBox.Show($"Iniciando o Ensaio do {ListaTecnologiasWifi.CheckedItems[i]}, configure o aparelho");
                                if (salva.EnsaiosItem11[0] == true)
                                {
                                    Ensaio_Largura_de_faixa_a_6_dB(TextBoxFreqC.Text, TextBoxIP.Text, ListaTecnologiasWifi.CheckedItems[i].ToString(), config);
                                    tl.SetValorPB((100 / it11.GetQuantidadeEnsaios()) / ListaTecnologiasWifi.CheckedItems.Count);
                                }
                                if (salva.EnsaiosItem11[1] == true)
                                {
                                    Ensaio_Largura_de_faixa_a_26_dB(TextBoxFreqC.Text, TextBoxIP.Text, ListaTecnologiasWifi.CheckedItems[i].ToString(), config);
                                    tl.SetValorPB((100 / it11.GetQuantidadeEnsaios()) / ListaTecnologiasWifi.CheckedItems.Count);
                                }
                                if (salva.EnsaiosItem11[2] == true)
                                {
                                    Ensaio_Potencia_de_Pico_Maxima(TextBoxFreqC.Text, TextBoxIP.Text, ListaTecnologiasWifi.CheckedItems[i].ToString(), config);
                                    tl.SetValorPB((100 / it11.GetQuantidadeEnsaios()) / ListaTecnologiasWifi.CheckedItems.Count);
                                }
                                if (salva.EnsaiosItem11[3] == true)
                                {
                                    Ensaio_Valor_médio_da_potência_máxima_de_saída(TextBoxFreqC.Text, TextBoxIP.Text, ListaTecnologiasWifi.CheckedItems[i].ToString(), config);
                                    tl.SetValorPB((100 / it11.GetQuantidadeEnsaios()) / ListaTecnologiasWifi.CheckedItems.Count);
                                }
                                if (salva.EnsaiosItem11[4] == true)
                                {
                                    Ensaio_pico_da_densidade_de_potência(TextBoxFreqC.Text, TextBoxIP.Text, ListaTecnologiasWifi.CheckedItems[i].ToString(), config);
                                    tl.SetValorPB((100 / it11.GetQuantidadeEnsaios()) / ListaTecnologiasWifi.CheckedItems.Count);
                                }
                                if (salva.EnsaiosItem11[5] == true)
                                {
                                    Ensaio_Valor_Medio_Densidade_Espectral(TextBoxFreqC.Text, TextBoxIP.Text, ListaTecnologiasWifi.CheckedItems[i].ToString(), config);
                                    tl.SetValorPB((100 / it11.GetQuantidadeEnsaios()) / ListaTecnologiasWifi.CheckedItems.Count);
                                }
                                if (salva.EnsaiosItem11[6] == true)
                                {
                                    for (int j = 0; j < 4; j++)
                                    {
                                        switch (j)
                                        {
                                            case 0:
                                                MessageBox.Show("Selecione no aparelho a frequencia Inicial");
                                                Ensaio_Espurios(salva.FreqEspuriosWifi[0], salva.FreqEspuriosWifi[1], TextBoxIP.Text, ListaTecnologiasWifi.CheckedItems[j].ToString(), config);
                                                break;
                                            case 1:
                                                Ensaio_Espurios(Convert.ToString(Convert.ToInt32(salva.FreqEspuriosWifi[1]) - 100), salva.FreqEspuriosWifi[1], TextBoxIP.Text, ListaTecnologiasWifi.CheckedItems[j].ToString(), config);
                                                break;
                                            case 2:
                                                MessageBox.Show("Selecione no aparelho a frequencia final");
                                                Ensaio_Espurios(salva.FreqEspuriosWifi[2], Convert.ToString(100 + Convert.ToInt32(salva.FreqEspuriosWifi[2])), TextBoxIP.Text, ListaTecnologiasWifi.CheckedItems[j].ToString(), config);
                                                break;
                                            case 3:
                                                Ensaio_Espurios(salva.FreqEspuriosWifi[2], salva.FreqEspuriosWifi[3], TextBoxIP.Text, ListaTecnologiasWifi.CheckedItems[j].ToString(), config);
                                                MessageBox.Show("Terminando ensaio de Espurios, volte pra frequencia de ensaio");
                                                break;

                                        }
                                    }
                                    tl.SetValorPB((100 / it11.GetQuantidadeEnsaios()) / ListaTecnologiasWifi.CheckedItems.Count);
                                }
                                if (salva.EnsaiosItem12[0] == true)
                                {
                                    Ensaio_Potencia_de_Saida(TextBoxFreqC.Text, TextBoxIP.Text, ListaTecnologiasWifi.CheckedItems[i].ToString(), config);
                                    tl.SetValorPB((100 / it12.GetQuantidadeEnsaios()) / ListaTecnologiasWifi.CheckedItems.Count);
                                }
                                if (salva.EnsaiosItem12[1] == true)
                                {
                                    Ensaio_Densidade_Espectral_de_Potencia(TextBoxFreqC.Text, TextBoxIP.Text, ListaTecnologiasWifi.CheckedItems[i].ToString(), config);
                                    tl.SetValorPB((100 / it12.GetQuantidadeEnsaios()) / ListaTecnologiasWifi.CheckedItems.Count);
                                }
                                if (salva.EnsaiosItem12[2] == true)
                                {
                                    for (int x = 0; x < 4; x++)
                                    {
                                        switch (x)
                                        {
                                            case 0:
                                                Ensaio_Espurios(salva.FreqEspuriosWifi[0], salva.FreqEspuriosWifi[1], TextBoxIP.Text, ListaTecnologiasWifi.CheckedItems[x].ToString(), config);
                                                break;
                                            case 1:
                                                Ensaio_Espurios(Convert.ToString(Convert.ToInt32(salva.FreqEspuriosWifi[1]) - 100), salva.FreqEspuriosWifi[1], TextBoxIP.Text, ListaTecnologiasWifi.CheckedItems[x].ToString(), config);
                                                break;
                                            case 2:
                                                Ensaio_Espurios(salva.FreqEspuriosWifi[2], Convert.ToString(100 + Convert.ToInt32(salva.FreqEspuriosWifi[2])), TextBoxIP.Text, ListaTecnologiasWifi.CheckedItems[x].ToString(), config);
                                                break;
                                            case 3:
                                                Ensaio_Espurios(salva.FreqEspuriosWifi[2], salva.FreqEspuriosWifi[3], TextBoxIP.Text, ListaTecnologiasWifi.CheckedItems[x].ToString(), config);
                                                break;

                                        }
                                    }
                                    tl.SetValorPB((100 / it12.GetQuantidadeEnsaios()) / ListaTecnologiasWifi.CheckedItems.Count);
                                }
                            }
                            tl.Close();
                            TocaRatinho();
                        }
                        else
                        {
                            if (ListaTecnologiasWifi.CheckedItems.Count == 0 && ListaTecnologiasBT.CheckedItems.Count != 0)
                            {

                                tl.Show();
                                for (int i = 0; i < ListaTecnologiasBT.CheckedItems.Count; i++)
                                {
                                    MessageBox.Show($"Iniciando o Ensaio do {ListaTecnologiasBT.CheckedItems[i]}, configure o aparelho");
                                    if (salva.EnsaiosItem10[0] == true)
                                    {
                                        radical.Largura_20dB(TextBoxFreqC.Text, TextBoxIP.Text, ListaTecnologiasBT.CheckedItems[i].ToString(), "2", CarregaRefLevel(), CarregaAtt(), config.GetTPrints(), CarregaMarca());
                                        tl.SetValorPB((100 / it10.GetQuantidadeEnsaios()) / ListaTecnologiasBT.CheckedItems.Count);
                                    }
                                    if (salva.EnsaiosItem10[1] == true)
                                    {
                                        Ensaio_Potencia_de_Pico_Maxima(TextBoxFreqC.Text, TextBoxIP.Text, ListaTecnologiasBT.CheckedItems[i].ToString(), config);
                                        tl.SetValorPB((100 / it10.GetQuantidadeEnsaios()) / ListaTecnologiasBT.CheckedItems.Count);
                                    }
                                    if (salva.EnsaiosItem10[2] == true)
                                    {
                                        for (int j = 0; j < 4; j++)
                                        {
                                            switch (j)
                                            {
                                                case 0:
                                                    MessageBox.Show("Selecione no aparelho a frequencia Inicial");
                                                    Ensaio_Espurios(salva.FreqEspuriosBT[0], salva.FreqEspuriosBT[1], TextBoxIP.Text, ListaTecnologiasBT.CheckedItems[j].ToString(), config);
                                                    break;
                                                case 1:
                                                    Ensaio_Espurios(Convert.ToString(Convert.ToInt32(salva.FreqEspuriosBT[1]) - 100), salva.FreqEspuriosBT[1], TextBoxIP.Text, ListaTecnologiasBT.CheckedItems[j].ToString(), config);
                                                    break;
                                                case 2:
                                                    MessageBox.Show("Selecione no aparelho a frequencia final");
                                                    Ensaio_Espurios(salva.FreqEspuriosBT[2], Convert.ToString(100 + Convert.ToInt32(salva.FreqEspuriosBT[2])), TextBoxIP.Text, ListaTecnologiasBT.CheckedItems[j].ToString(), config);
                                                    break;
                                                case 3:
                                                    Ensaio_Espurios(salva.FreqEspuriosBT[2], salva.FreqEspuriosBT[3], TextBoxIP.Text, ListaTecnologiasBT.CheckedItems[j].ToString(), config);
                                                    MessageBox.Show("Terminando ensaio de Espurios, volte pra frequencia de ensaio");
                                                    break;
                                            }
                                        }
                                        tl.SetValorPB((100 / it10.GetQuantidadeEnsaios()) / ListaTecnologiasBT.CheckedItems.Count);
                                    }
                                    if (salva.EnsaiosItem10[3] == true)
                                    {
                                        MessageBox.Show("Iniciando ensaio de separação de canais de salto, coloque o dispositivo em modo de salto");
                                        Ensaio_Separação_de_Canais_de_Salto(TextBoxFreqC.Text, TextBoxIP.Text, ListaTecnologiasBT.CheckedItems[i].ToString(), config);
                                        tl.SetValorPB((100 / it10.GetQuantidadeEnsaios()) / ListaTecnologiasBT.CheckedItems.Count);
                                    }
                                    if (salva.EnsaiosItem10[4] == true)
                                    {
                                        MessageBox.Show("Iniciando Ensaio de numero de Canais de Salto, coloque o dispositivo em modo salto!");
                                        Ensaio_Numero_de_Canais(salva.FreqNumeroCanaisDeSalto[0], salva.FreqNumeroCanaisDeSalto[2], salva.FreqNumeroCanaisDeSalto[1], TextBoxIP.Text, ListaTecnologiasBT.CheckedItems[i].ToString(), config);
                                        tl.SetValorPB((100 / it10.GetQuantidadeEnsaios()) / ListaTecnologiasBT.CheckedItems.Count);
                                    }
                                    if (salva.EnsaiosItem10[5] == true)
                                    {
                                        MessageBox.Show("Iniciando ensaio de numero de ocupações, coloque o dispositivo em modo de salto");
                                        Ensaio_Numero_de_Ocupações(TextBoxFreqC.Text, TextBoxIP.Text, ListaTecnologiasBT.CheckedItems[i].ToString(), config);
                                        tl.SetValorPB((100 / it10.GetQuantidadeEnsaios()) / ListaTecnologiasBT.CheckedItems.Count);

                                    }
                                    if (salva.EnsaiosItem10[6] == true)
                                    {
                                        MessageBox.Show("Iniciando ensaio de Tempo de Ocupação, coloque o dispositivo em modo de salto");
                                        Ensaio_Tempo_de_Ocupação(TextBoxFreqC.Text, TextBoxIP.Text, ListaTecnologiasBT.CheckedItems[i].ToString(), config);
                                        tl.SetValorPB((100 / it10.GetQuantidadeEnsaios()) / ListaTecnologiasBT.CheckedItems.Count);
                                    }
                                }
                                tl.Close();
                                TocaRatinho();
                            }
                            else
                            {
                                MessageBox.Show("Selecione Tecnologia de Apenas um Tipo");
                            }
                        }

                    }
                    else
                    {
                        MessageBox.Show("Nenhuma Maquina Conectada");
                    }

                }
                else
                {
                    MessageBox.Show("Selecione uma Frequencia");
                }
            }
            else
            {
                MessageBox.Show("Selecione uma Tecnologia");
            }


        }

        private static void TocaRatinho()
        {
            //SoundPlayer simpleSound = new SoundPlayer(@"C:\Users\80400197\Documents\GitHub\Automacao-N9010A\Automacao N9010A\Ratinho.wav");
            //simpleSound.Play();
        }
        private void BtSelTodos_Click(object sender, EventArgs e)
        {
            if (CBSelTipo.Text == "Wifi")
            {
                for (int i = 0; i < ListaTecnologiasWifi.Items.Count; i++)
                {
                    ListaTecnologiasWifi.SetItemChecked(i, true);
                }
            }
            else
            {
                for (int i = 0; i < ListaTecnologiasBT.Items.Count; i++)
                {
                    ListaTecnologiasBT.SetItemChecked(i, true);
                }
            }

        }

        private void BtLimpar_Click(object sender, EventArgs e)
        {
            if (CBSelTipo.Text == "Wifi")
            {
                for (int i = 0; i < ListaTecnologiasWifi.Items.Count; i++)
                {
                    ListaTecnologiasWifi.SetItemChecked(i, false);
                }
            }
            else
            {
                for (int i = 0; i < ListaTecnologiasBT.Items.Count; i++)
                {
                    ListaTecnologiasBT.SetItemChecked(i, false);
                }
            }
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
                ListaTecnologiasBT.Visible = false;
                ListaTecnologiasWifi.Visible = true;
            }
            else
            {
                ListaTecnologiasBT.Visible = true;
                ListaTecnologiasWifi.Visible = false;
            }
        }

        private void GrupoDasNormas_Enter(object sender, EventArgs e)
        {

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
