# 📦 E-commerce DB — Projeto prático

## 📌 Descrição
Banco de dados relacional criado como exercício prático para um cenário de **e-commerce**.  
Inclui tabelas para clientes, produtos, pagamentos, pedidos, fornecedores, vendedores, estoques e tabelas de relacionamento **M:N** para modelar fornecedores ↔ produtos, vendedores ↔ produtos, estoque ↔ produtos e produtos ↔ pedidos.


## 🗄️ Estrutura do esquema

### Tabelas principais
- **clients**
  - `idCliente` (PK, AUTO_INCREMENT)  
  - `Fname`, `Minit`, `Lname`  
  - `CPF` (único)  
  - `Address`  

- **product**
  - `idProduct` (PK)  
  - `Pname`, `classification_kids`, `category`, `feedback`, `size`  

- **payments**
  - `idPayment` (PK)  
  - `idClient` (FK → `clients`)  
  - `typePayment`, `limitAvailable`  

- **orders**
  - `idOrder` (PK)  
  - `idOrderClient` (FK → `clients`)  
  - `idPayment` (FK → `payments`)  
  - `OrderStatus`, `OrderDescription`, `sendValue`, `paymentCash`  

- **productStorage**
  - `idProdStorage` (PK)  
  - `StorageLocation`, `Quantity`  

- **supplier**
  - `idSupplier` (PK)  
  - `SocialName`, `CNPJ` (único), `Contact`  

- **seller**
  - `idSeller` (PK)  
  - `SocialName`, `AbstName`, `CNPJ`, `CPF`, `Location`, `Contact`  

### Tabelas de relacionamento (M:N)
- **productSeller** — produtos vendidos por vendedores  
- **productOrder** — produtos associados a pedidos  
- **storeagelocation** — produtos em locais de estoque  
- **ProductSupplier** — fornecedores que fornecem produtos  

---
