using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _4_ConversoesEOutrosTiposNumericos
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Executando o projeto 4");

            Console.WriteLine("testando condicionais");

            int idade = 20;
            int quantidadePessoas = 3;
            //bool acompanhado = true;

            if (quantidadePessoas >= 2)
            {
                bool acompanhado = true;
            }
            else
            {
                bool acompanhado = false;
            }

            if (idade >= 18 || acompanhado)
            {
                Console.WriteLine("Seja bem vindo");
            }
            else
            {
                Console.WriteLine("infelizmente voce nao pode entrar");
            }


            double salario = 1200.50;

            //O int é um tipo de variável que suporta valores até 32 bits
            int salarioEmInteiro = (int)salario;

            Console.WriteLine(salarioEmInteiro);

            // O long é uma variável de 64 bits
            idade = 1300000000;
            Console.WriteLine(idade);

            //O short é um tipo de variável de 16 bits
            short quantidadeProdutos = 150;
            Console.WriteLine(quantidadeProdutos);

            float altura = 1.80f;
            Console.WriteLine(altura);

            Console.ReadLine();
        }
    }
}
