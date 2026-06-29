import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'auth_provider.dart';

class FabGreen extends StatefulWidget {
  final int lugarId;

  const FabGreen({
    super.key,
    required this.lugarId,
  });

  @override
  State<FabGreen> createState() => _FabGreen();
}

class _FabGreen extends State<FabGreen> {
  var _fabIcon = Icons.favorite_border;
  bool _isLoading = false;

  Future<void> onPressedFav() async {
    final auth = Provider.of<AuthProvider>(context, listen: false);

    if (!auth.isLoggedIn || auth.token.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debes iniciar sesión para agregar favoritos')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final response = await http.post(
      Uri.parse('http://dale1.click/api/favoritos/'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Token ${auth.token}',
      },
      body: jsonEncode({
        'lugar': widget.lugarId,
      }),
    );

    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 201) {
      setState(() {
        _fabIcon = Icons.favorite;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lugar agregado a favoritos')),
      );
    } else if (response.statusCode == 400 || response.statusCode == 403) {
      setState(() {
        _fabIcon = Icons.favorite;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Este lugar ya está en favoritos')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al agregar favorito: ${response.statusCode}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFF0da64b),
      mini: true,
      tooltip: "Favorito",
      child: _isLoading
          ? const SizedBox(
        width: 18,
        height: 18,
        child: CircularProgressIndicator(strokeWidth: 2),
      )
          : Icon(_fabIcon, color: Colors.white),
      onPressed: _isLoading ? null : onPressedFav,
    );
  }
}