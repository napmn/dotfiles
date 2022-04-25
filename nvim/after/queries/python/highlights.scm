((class_definition
  body: (block
          (expression_statement
            (assignment
              left: (identifier) @none))))
 (#vim-match? @none "^([A-Z])@!.*$"))
((class_definition
  body: (block
          (expression_statement
            (assignment
              left: (_ 
                     (identifier) @none)))))
 (#vim-match? @none "^([A-Z])@!.*$"))
