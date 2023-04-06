"""empty message

Revision ID: 650f4be04be2
Revises: d08956fe88e7
Create Date: 2023-04-06 06:20:21.381188

"""
from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import postgresql

# revision identifiers, used by Alembic.
revision = '650f4be04be2'
down_revision = 'd08956fe88e7'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('user', schema=None) as batch_op:
        batch_op.drop_column('subscription_date')

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('user', schema=None) as batch_op:
        batch_op.add_column(sa.Column('subscription_date', postgresql.TIMESTAMP(), autoincrement=False, nullable=True))

    # ### end Alembic commands ###