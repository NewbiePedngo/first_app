import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Assignmentweek5 extends StatefulWidget {
  const Assignmentweek5({super.key});

  @override
  State<Assignmentweek5> createState() => _Assignmentweek5State();
}

class _Assignmentweek5State extends State<Assignmentweek5> {
  List<dynamic> products = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var response = await http.get(
        Uri.parse('http://localhost:8001/products'),
      );
      if (response.statusCode == 200) {
        setState(() {
          products = jsonDecode(response.body);
        });
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteProduct(String id) async {
    try {
      var response = await http.delete(
        Uri.parse("http://localhost:8001/products/$id"),
      );
      if (response.statusCode == 200) {
        fetchData();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("🗑️ ลบสินค้าสำเร็จ")));
      } else {
        throw Exception("Failed to delete product");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> createProduct(Map<String, dynamic> productData) async {
    try {
      var response = await http.post(
        Uri.parse("http://localhost:8001/products"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(productData),
      );
      if (response.statusCode == 201) {
        fetchData();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("✅ เพิ่มสินค้าสำเร็จ")));
      } else {
        throw Exception("Failed to create product");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateProduct(
    String id,
    Map<String, dynamic> productData,
  ) async {
    try {
      var response = await http.put(
        Uri.parse("http://localhost:8001/products/$id"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(productData),
      );
      if (response.statusCode == 200) {
        fetchData();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("✏️ แก้ไขสินค้าสำเร็จ")));
      } else {
        throw Exception(" ❌ แก้ไขสินค้าไม่สำเร็จ");
      }
    } catch (e) {
      print(e);
    }
  }

  void openForm({Map<String, dynamic>? product}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductFormPage(product: product),
      ),
    );

    if (result != null && result is Map<String, dynamic>) {
      if (product == null) {
        createProduct(result);
      } else {
        updateProduct(product["id"].toString(), result);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('📱 Product'),
        backgroundColor: const Color.fromARGB(255, 150, 117, 186),
      ),
      body: products.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: products.length,
              itemBuilder: (ctx, index) {
                var product = products[index];
                return Dismissible(
                  key: Key(product["id"].toString()),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.red.shade400,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  confirmDismiss: (direction) async {
                    return await showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text("ยืนยันการลบ"),
                        content: const Text("คุณต้องการลบสินค้านี้ใช่หรือไม่?"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(ctx).pop(false),
                            child: const Text("ยกเลิก"),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            onPressed: () => Navigator.of(ctx).pop(true),
                            child: const Text("ลบ"),
                          ),
                        ],
                      ),
                    );
                  },
                  onDismissed: (direction) {
                    deleteProduct(product["id"].toString());
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      leading: CircleAvatar(
                        backgroundColor: const Color.fromARGB(
                          255,
                          211,
                          192,
                          246,
                        ),
                        child: const Icon(
                          Icons.phone_android,
                          color: Color.fromARGB(255, 77, 54, 94),
                          size: 22,
                        ),
                      ),
                      title: Text(
                        product["name"],
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color.fromARGB(255, 90, 37, 114),
                        ),
                      ),
                      subtitle: Text(
                        product["description"],
                        style: const TextStyle(
                          color: Color.fromARGB(137, 144, 96, 168),
                        ),
                      ),
                      trailing: Text(
                        "${product["price"]}",
                        style: const TextStyle(
                          color: Color.fromARGB(255, 95, 39, 156),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () => openForm(product: product),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 150, 117, 186),
        onPressed: () => openForm(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ProductFormPage extends StatefulWidget {
  final Map<String, dynamic>? product;
  const ProductFormPage({super.key, this.product});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameCtrl;
  late TextEditingController descCtrl;
  late TextEditingController priceCtrl;

  @override
  void initState() {
    super.initState();
    nameCtrl = TextEditingController(text: widget.product?["name"] ?? "");
    descCtrl = TextEditingController(
      text: widget.product?["description"] ?? "",
    );
    priceCtrl = TextEditingController(
      text: widget.product?["price"]?.toString() ?? "",
    );
  }

  void saveForm() {
    if (_formKey.currentState!.validate()) {
      final data = {
        "name": nameCtrl.text,
        "description": descCtrl.text,
        "price": double.tryParse(priceCtrl.text) ?? 0,
      };
      Navigator.pop(context, data);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isEdit = widget.product != null;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(isEdit ? "แก้ไขสินค้า" : "เพิ่มสินค้าใหม่"),
        backgroundColor: Color.fromARGB(255, 186, 117, 181),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameCtrl,
                decoration: InputDecoration(
                  labelText: "ชื่อสินค้า",
                  prefixIcon: const Icon(Icons.shopping_bag),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (v) =>
                    v == null || v.isEmpty ? "กรุณากรอกชื่อสินค้า" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: descCtrl,
                decoration: InputDecoration(
                  labelText: "รายละเอียดสินค้า",
                  prefixIcon: const Icon(Icons.description),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: priceCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "ราคา",
                  prefixIcon: const Icon(Icons.attach_money),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (v) =>
                    v == null || v.isEmpty ? "กรุณากรอกราคา" : null,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.save),
                  label: Text(
                    isEdit ? "บันทึกการแก้ไข" : "เพิ่มสินค้า",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 92, 25, 82), 
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: const Color.fromARGB(169, 233, 117, 220),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: saveForm,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
