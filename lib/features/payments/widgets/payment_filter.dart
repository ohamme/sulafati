import 'package:flutter/material.dart';


class PaymentFilter extends StatelessWidget {


  final TextEditingController searchController;


  final String selectedFilter;


  final ValueChanged<String> onSearch;


  final ValueChanged<String> onFilterChanged;



  const PaymentFilter({

    super.key,

    required this.searchController,

    required this.selectedFilter,

    required this.onSearch,

    required this.onFilterChanged,

  });



  @override
  Widget build(BuildContext context) {


    return Padding(

      padding: const EdgeInsets.all(16),

      child: Column(

        children: [


          //--------------------------------
          // البحث
          //--------------------------------


          TextField(

            controller: searchController,


            onChanged: onSearch,


            decoration: InputDecoration(


              hintText:
                  "البحث في الدفعات...",


              prefixIcon:
                  const Icon(
                    Icons.search,
                  ),


              filled: true,


              fillColor:
                  Colors.grey.shade100,


              border:
                  OutlineInputBorder(

                borderRadius:
                    BorderRadius.circular(
                      15,
                    ),

                borderSide:
                    BorderSide.none,

              ),

            ),

          ),



          const SizedBox(height: 15),




          //--------------------------------
          // الفلاتر
          //--------------------------------


          SingleChildScrollView(

            scrollDirection:
                Axis.horizontal,


            child: Row(

              children: [


                _buildFilter(
                  "الكل",
                ),


                _buildFilter(
                  "مدفوع",
                ),


                _buildFilter(
                  "غير مدفوع",
                ),


                _buildFilter(
                  "متأخر",
                ),


              ],

            ),

          ),



        ],

      ),

    );


  }





  Widget _buildFilter(
      String value,
      ) {


    final selected =
        selectedFilter == value;



    return Padding(

      padding:
          const EdgeInsets.only(
            left: 8,
          ),


      child: ChoiceChip(

        label:
            Text(value),


        selected:
            selected,


        selectedColor:
            const Color(
              0xff0F766E,
            ),



        labelStyle:
            TextStyle(

          color: selected
              ? Colors.white
              : Colors.black87,


          fontWeight:
              FontWeight.bold,

        ),



        onSelected: (_) {

          onFilterChanged(
            value,
          );

        },


      ),


    );


  }


}