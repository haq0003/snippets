1/ Create ROOT_PATH/src/DoctrineExtension/SqlCalcFoundRows.php with

```
<?php

namespace App\DoctrineExtension;

use Doctrine\ORM\Query\AST\Functions\FunctionNode;
use Doctrine\ORM\Query\Lexer;
use Doctrine\ORM\Query\Parser;
use Doctrine\ORM\Query\SqlWalker;

class SqlCalcFoundRows extends SqlWalker
{
    public function walkSelectClause($selectClause)
    {

        $sql = parent::walkSelectClause($selectClause);

        if ($this->getQuery()->getHint('mysqlWalker.sqlCalcFoundRows') === true) {
            if ($selectClause->isDistinct) {
                $sql = str_replace('SELECT DISTINCT', 'SELECT DISTINCT SQL_CALC_FOUND_ROWS', $sql);
            } else {
                $sql = str_replace('SELECT', 'SELECT SQL_CALC_FOUND_ROWS', $sql);
            }
        }

        return $sql;
    }
}
```

2/ To use it 

    call first
    ```
    $qb = $query->createQueryBuilder();
    (...)
    $query = $qb->getQuery();
    ```
    Then
    ```
    $query->setHint(Query::HINT_CUSTOM_OUTPUT_WALKER, 'App\DoctrineExtension\SqlCalcFoundRows');
    $query->setHint("mysqlWalker.sqlCalcFoundRows", true);
    
    $query->execute();
    $count = $conn->query('SELECT FOUND_ROWS()')->fetch(\PDO::FETCH_COLUMN);
    
    ```
---
DEBUG :
```
var_dump($query->getSql());
var_dump($query->getParameters());
var_dump($query->getResult(\PDO::FETCH_ASSOC));
```


